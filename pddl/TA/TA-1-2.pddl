(define
  (domain DirectedController)
  
  (:requirements
    :typing
    :non-deterministic
    :conditional-effects
  )
  
  (:types
    LTS
    State
    Label
    Phase
  )
  
  (:constants
    $AgencyMonitor $ServiceMonitor-0 $Service-0 $Agency - LTS
    $-1 $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 - State
    $agency-request $query-fail-0 $unavailable-0 $agency-succ $query-0 $committed-0 $cancel-0 $purchase-0 $agency-fail $steps-0-1 $available-0 $steps-0-0 $select-0 $uncommitted-0 $query-succ-0 $purchase-fail-0 $purchase-succ-0 - Label
    setup idle busy complete uncontrollable looping event - Phase
  )
  
  (:predicates
    (at ?s - State ?m - LTS)
    (ready ?a - Label ?m - LTS)
    (marked ?s - State ?m - LTS)
    (hoop ?m - LTS)
    (enabled ?a - Label)
    (inprogress ?a - Label)
    (status ?c - Phase)
  )
  
  (:action reset
    :precondition
      (and
        (not (status setup))
        (not (status idle))
        (not (status busy))
      )
    :effect
      (and
        (status setup)
        (not (status uncontrollable))
        (not (status complete))
        (not (enabled $agency-request))
        (not (enabled $query-fail-0))
        (not (enabled $unavailable-0))
        (not (enabled $agency-succ))
        (not (enabled $query-0))
        (not (enabled $committed-0))
        (not (enabled $cancel-0))
        (not (enabled $purchase-0))
        (not (enabled $agency-fail))
        (not (enabled $steps-0-1))
        (not (enabled $available-0))
        (not (enabled $steps-0-0))
        (not (enabled $select-0))
        (not (enabled $uncommitted-0))
        (not (enabled $query-succ-0))
        (not (enabled $purchase-fail-0))
        (not (enabled $purchase-succ-0))
        (not (inprogress $agency-request))
        (not (inprogress $query-fail-0))
        (not (inprogress $unavailable-0))
        (not (inprogress $query-0))
        (not (inprogress $committed-0))
        (not (inprogress $steps-0-1))
        (not (inprogress $available-0))
        (not (inprogress $steps-0-0))
        (not (inprogress $select-0))
        (not (inprogress $uncommitted-0))
        (not (inprogress $query-succ-0))
        (not (inprogress $purchase-succ-0))
        (not (inprogress $purchase-fail-0))
        (not (ready $query-fail-0 $AgencyMonitor))
        (not (ready $agency-succ $AgencyMonitor))
        (not (ready $uncommitted-0 $AgencyMonitor))
        (not (ready $agency-fail $AgencyMonitor))
        (not (ready $purchase-fail-0 $AgencyMonitor))
        (not (ready $query-fail-0 $ServiceMonitor-0))
        (not (ready $agency-succ $ServiceMonitor-0))
        (not (ready $query-0 $ServiceMonitor-0))
        (not (ready $cancel-0 $ServiceMonitor-0))
        (not (ready $query-succ-0 $ServiceMonitor-0))
        (not (ready $agency-fail $ServiceMonitor-0))
        (not (ready $purchase-succ-0 $ServiceMonitor-0))
        (not (ready $purchase-fail-0 $ServiceMonitor-0))
        (not (ready $unavailable-0 $Service-0))
        (not (ready $query-fail-0 $Service-0))
        (not (ready $agency-succ $Service-0))
        (not (ready $query-0 $Service-0))
        (not (ready $committed-0 $Service-0))
        (not (ready $cancel-0 $Service-0))
        (not (ready $purchase-0 $Service-0))
        (not (ready $agency-fail $Service-0))
        (not (ready $steps-0-1 $Service-0))
        (not (ready $available-0 $Service-0))
        (not (ready $steps-0-0 $Service-0))
        (not (ready $select-0 $Service-0))
        (not (ready $uncommitted-0 $Service-0))
        (not (ready $query-succ-0 $Service-0))
        (not (ready $purchase-succ-0 $Service-0))
        (not (ready $purchase-fail-0 $Service-0))
        (not (ready $agency-request $Agency))
        (not (ready $agency-succ $Agency))
        (not (ready $query-0 $Agency))
        (not (ready $agency-fail $Agency))
        (not (hoop $AgencyMonitor))
        (not (hoop $ServiceMonitor-0))
        (not (hoop $Service-0))
        (not (hoop $Agency))
      )
  )
  
  (:action setReady
    :precondition
      (and
        (status setup)
        (not (status busy))
      )
    :effect
      (and
        (status busy)
        (when (at $0 $AgencyMonitor)
          (and
            (ready $query-fail-0 $AgencyMonitor)
            (ready $agency-fail $AgencyMonitor)
            (ready $agency-succ $AgencyMonitor)
            (ready $uncommitted-0 $AgencyMonitor)
          )
        )
        (when (at $1 $AgencyMonitor)
          (and
            (ready $query-fail-0 $AgencyMonitor)
            (ready $purchase-fail-0 $AgencyMonitor)
            (ready $agency-fail $AgencyMonitor)
            (ready $agency-succ $AgencyMonitor)
            (ready $uncommitted-0 $AgencyMonitor)
          )
        )
        (when (at $2 $AgencyMonitor)
          (and
            (ready $query-fail-0 $AgencyMonitor)
            (ready $purchase-fail-0 $AgencyMonitor)
            (ready $agency-fail $AgencyMonitor)
            (ready $agency-succ $AgencyMonitor)
            (ready $uncommitted-0 $AgencyMonitor)
          )
        )
        (when (at $0 $ServiceMonitor-0)
          (and
            (ready $query-0 $ServiceMonitor-0)
            (ready $agency-fail $ServiceMonitor-0)
            (ready $agency-succ $ServiceMonitor-0)
          )
        )
        (when (at $1 $ServiceMonitor-0)
          (and
            (ready $query-fail-0 $ServiceMonitor-0)
            (ready $agency-fail $ServiceMonitor-0)
            (ready $agency-succ $ServiceMonitor-0)
            (ready $query-succ-0 $ServiceMonitor-0)
          )
        )
        (when (at $2 $ServiceMonitor-0)
          (and
            (ready $purchase-fail-0 $ServiceMonitor-0)
            (ready $agency-fail $ServiceMonitor-0)
            (ready $purchase-succ-0 $ServiceMonitor-0)
            (ready $agency-succ $ServiceMonitor-0)
            (ready $cancel-0 $ServiceMonitor-0)
          )
        )
        (when (at $3 $ServiceMonitor-0)
          (and
            (ready $agency-fail $ServiceMonitor-0)
            (ready $agency-succ $ServiceMonitor-0)
          )
        )
        (when (at $4 $ServiceMonitor-0)
          (and
            (ready $agency-fail $ServiceMonitor-0)
            (ready $agency-succ $ServiceMonitor-0)
          )
        )
        (when (at $0 $Service-0)
          (and
            (ready $query-0 $Service-0)
            (ready $agency-fail $Service-0)
            (ready $agency-succ $Service-0)
          )
        )
        (when (at $1 $Service-0)
          (and
            (ready $unavailable-0 $Service-0)
            (ready $available-0 $Service-0)
          )
        )
        (when (at $2 $Service-0)
          (and
            (ready $steps-0-1 $Service-0)
            (ready $steps-0-0 $Service-0)
          )
        )
        (when (at $3 $Service-0)
          (ready $query-succ-0 $Service-0)
        )
        (when (at $4 $Service-0)
          (and
            (ready $committed-0 $Service-0)
            (ready $uncommitted-0 $Service-0)
          )
        )
        (when (at $5 $Service-0)
          (and
            (ready $agency-fail $Service-0)
            (ready $agency-succ $Service-0)
            (ready $cancel-0 $Service-0)
            (ready $purchase-0 $Service-0)
          )
        )
        (when (at $6 $Service-0)
          (and
            (ready $purchase-fail-0 $Service-0)
            (ready $purchase-succ-0 $Service-0)
          )
        )
        (when (at $7 $Service-0)
          (and
            (ready $agency-fail $Service-0)
            (ready $agency-succ $Service-0)
            (ready $cancel-0 $Service-0)
            (ready $purchase-0 $Service-0)
          )
        )
        (when (at $8 $Service-0)
          (ready $purchase-succ-0 $Service-0)
        )
        (when (at $9 $Service-0)
          (ready $query-succ-0 $Service-0)
        )
        (when (at $10 $Service-0)
          (ready $select-0 $Service-0)
        )
        (when (at $11 $Service-0)
          (ready $query-fail-0 $Service-0)
        )
        (when (at $0 $Agency)
          (ready $agency-request $Agency)
        )
        (when (at $1 $Agency)
          (and
            (ready $query-0 $Agency)
            (ready $agency-fail $Agency)
            (ready $agency-succ $Agency)
          )
        )
        (when (and (at $-1 $AgencyMonitor) (marked $-1 $AgencyMonitor))
          (hoop $AgencyMonitor)
        )
        (when (and (at $0 $AgencyMonitor) (marked $0 $AgencyMonitor))
          (hoop $AgencyMonitor)
        )
        (when (and (at $1 $AgencyMonitor) (marked $1 $AgencyMonitor))
          (hoop $AgencyMonitor)
        )
        (when (and (at $2 $AgencyMonitor) (marked $2 $AgencyMonitor))
          (hoop $AgencyMonitor)
        )
        (when (and (at $-1 $ServiceMonitor-0) (marked $-1 $ServiceMonitor-0))
          (hoop $ServiceMonitor-0)
        )
        (when (and (at $0 $ServiceMonitor-0) (marked $0 $ServiceMonitor-0))
          (hoop $ServiceMonitor-0)
        )
        (when (and (at $1 $ServiceMonitor-0) (marked $1 $ServiceMonitor-0))
          (hoop $ServiceMonitor-0)
        )
        (when (and (at $2 $ServiceMonitor-0) (marked $2 $ServiceMonitor-0))
          (hoop $ServiceMonitor-0)
        )
        (when (and (at $3 $ServiceMonitor-0) (marked $3 $ServiceMonitor-0))
          (hoop $ServiceMonitor-0)
        )
        (when (and (at $4 $ServiceMonitor-0) (marked $4 $ServiceMonitor-0))
          (hoop $ServiceMonitor-0)
        )
        (when (and (at $0 $Service-0) (marked $0 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $1 $Service-0) (marked $1 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $2 $Service-0) (marked $2 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $3 $Service-0) (marked $3 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $4 $Service-0) (marked $4 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $5 $Service-0) (marked $5 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $6 $Service-0) (marked $6 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $7 $Service-0) (marked $7 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $8 $Service-0) (marked $8 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $9 $Service-0) (marked $9 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $10 $Service-0) (marked $10 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $11 $Service-0) (marked $11 $Service-0))
          (hoop $Service-0)
        )
        (when (and (at $0 $Agency) (marked $0 $Agency))
          (hoop $Agency)
        )
        (when (and (at $1 $Agency) (marked $1 $Agency))
          (hoop $Agency)
        )
      )
  )
  
  (:action setEnabled
    :precondition
      (and
        (status setup)
        (status busy)
      )
    :effect
      (and
        (not (status setup))
        (not (status busy))
        (not (status event))
        (status idle)
        (when
          (and
            (ready $agency-request $Agency)
          )
          (enabled $agency-request)
        )
        (when
          (and
            (ready $query-fail-0 $AgencyMonitor)
            (ready $query-fail-0 $ServiceMonitor-0)
            (ready $query-fail-0 $Service-0)
          )
          (enabled $query-fail-0)
        )
        (when
          (and
            (ready $unavailable-0 $Service-0)
          )
          (enabled $unavailable-0)
        )
        (when
          (and
            (ready $agency-succ $AgencyMonitor)
            (ready $agency-succ $ServiceMonitor-0)
            (ready $agency-succ $Service-0)
            (ready $agency-succ $Agency)
          )
          (enabled $agency-succ)
        )
        (when
          (and
            (ready $query-0 $ServiceMonitor-0)
            (ready $query-0 $Service-0)
            (ready $query-0 $Agency)
          )
          (enabled $query-0)
        )
        (when
          (and
            (ready $committed-0 $Service-0)
          )
          (enabled $committed-0)
        )
        (when
          (and
            (ready $cancel-0 $ServiceMonitor-0)
            (ready $cancel-0 $Service-0)
          )
          (enabled $cancel-0)
        )
        (when
          (and
            (ready $purchase-0 $Service-0)
          )
          (enabled $purchase-0)
        )
        (when
          (and
            (ready $agency-fail $AgencyMonitor)
            (ready $agency-fail $ServiceMonitor-0)
            (ready $agency-fail $Service-0)
            (ready $agency-fail $Agency)
          )
          (enabled $agency-fail)
        )
        (when
          (and
            (ready $steps-0-1 $Service-0)
          )
          (enabled $steps-0-1)
        )
        (when
          (and
            (ready $available-0 $Service-0)
          )
          (enabled $available-0)
        )
        (when
          (and
            (ready $steps-0-0 $Service-0)
          )
          (enabled $steps-0-0)
        )
        (when
          (and
            (ready $select-0 $Service-0)
          )
          (enabled $select-0)
        )
        (when
          (and
            (ready $uncommitted-0 $AgencyMonitor)
            (ready $uncommitted-0 $Service-0)
          )
          (enabled $uncommitted-0)
        )
        (when
          (and
            (ready $query-succ-0 $ServiceMonitor-0)
            (ready $query-succ-0 $Service-0)
          )
          (enabled $query-succ-0)
        )
        (when
          (and
            (ready $purchase-fail-0 $AgencyMonitor)
            (ready $purchase-fail-0 $ServiceMonitor-0)
            (ready $purchase-fail-0 $Service-0)
          )
          (enabled $purchase-fail-0)
        )
        (when
          (and
            (ready $purchase-succ-0 $ServiceMonitor-0)
            (ready $purchase-succ-0 $Service-0)
          )
          (enabled $purchase-succ-0)
        )
      )
  )
  
  (:action pick
    :precondition
      (and
        (status idle)
      )
    :effect
      (and
        (not (status idle))
        (status busy)
        (oneof
          (when (enabled $agency-request) (and (inprogress $agency-request) (status uncontrollable)))
          (when (enabled $query-fail-0) (and (inprogress $query-fail-0) (status uncontrollable)))
          (when (enabled $unavailable-0) (and (inprogress $unavailable-0) (status uncontrollable)))
          (when (enabled $query-0) (and (inprogress $query-0) (status uncontrollable)))
          (when (enabled $committed-0) (and (inprogress $committed-0) (status uncontrollable)))
          (when (enabled $steps-0-1) (and (inprogress $steps-0-1) (status uncontrollable)))
          (when (enabled $available-0) (and (inprogress $available-0) (status uncontrollable)))
          (when (enabled $steps-0-0) (and (inprogress $steps-0-0) (status uncontrollable)))
          (when (enabled $select-0) (and (inprogress $select-0) (status uncontrollable)))
          (when (enabled $uncommitted-0) (and (inprogress $uncommitted-0) (status uncontrollable)))
          (when (enabled $query-succ-0) (and (inprogress $query-succ-0) (status uncontrollable)))
          (when (enabled $purchase-succ-0) (and (inprogress $purchase-succ-0) (status uncontrollable)))
          (when (enabled $purchase-fail-0) (and (inprogress $purchase-fail-0) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $agency-request))
        (not (inprogress $query-fail-0))
        (not (inprogress $unavailable-0))
        (not (inprogress $query-0))
        (not (inprogress $committed-0))
        (not (inprogress $steps-0-1))
        (not (inprogress $available-0))
        (not (inprogress $steps-0-0))
        (not (inprogress $select-0))
        (not (inprogress $uncommitted-0))
        (not (inprogress $query-succ-0))
        (not (inprogress $purchase-succ-0))
        (not (inprogress $purchase-fail-0))
      )
    :effect
      (and
        (inprogress $agency-request)
        (inprogress $query-fail-0)
        (inprogress $unavailable-0)
        (inprogress $query-0)
        (inprogress $committed-0)
        (inprogress $steps-0-1)
        (inprogress $available-0)
        (inprogress $steps-0-0)
        (inprogress $select-0)
        (inprogress $uncommitted-0)
        (inprogress $query-succ-0)
        (inprogress $purchase-succ-0)
        (inprogress $purchase-fail-0)
      )
  )
  
  (:action loop
    :precondition
      (and
        (status complete)
        (status event)
        (not (status looping))
      )
    :effect
      (and
        (not (status event))
        (status looping)
        (when (at $-1 $AgencyMonitor) (marked $-1 $AgencyMonitor))
        (when (at $0 $AgencyMonitor) (marked $0 $AgencyMonitor))
        (when (at $1 $AgencyMonitor) (marked $1 $AgencyMonitor))
        (when (at $2 $AgencyMonitor) (marked $2 $AgencyMonitor))
        (when (at $-1 $ServiceMonitor-0) (marked $-1 $ServiceMonitor-0))
        (when (at $0 $ServiceMonitor-0) (marked $0 $ServiceMonitor-0))
        (when (at $1 $ServiceMonitor-0) (marked $1 $ServiceMonitor-0))
        (when (at $2 $ServiceMonitor-0) (marked $2 $ServiceMonitor-0))
        (when (at $3 $ServiceMonitor-0) (marked $3 $ServiceMonitor-0))
        (when (at $4 $ServiceMonitor-0) (marked $4 $ServiceMonitor-0))
        (when (at $0 $Service-0) (marked $0 $Service-0))
        (when (at $1 $Service-0) (marked $1 $Service-0))
        (when (at $2 $Service-0) (marked $2 $Service-0))
        (when (at $3 $Service-0) (marked $3 $Service-0))
        (when (at $4 $Service-0) (marked $4 $Service-0))
        (when (at $5 $Service-0) (marked $5 $Service-0))
        (when (at $6 $Service-0) (marked $6 $Service-0))
        (when (at $7 $Service-0) (marked $7 $Service-0))
        (when (at $8 $Service-0) (marked $8 $Service-0))
        (when (at $9 $Service-0) (marked $9 $Service-0))
        (when (at $10 $Service-0) (marked $10 $Service-0))
        (when (at $11 $Service-0) (marked $11 $Service-0))
        (when (at $0 $Agency) (marked $0 $Agency))
        (when (at $1 $Agency) (marked $1 $Agency))
      )
  )
  
  (:action do$agency-request
    :precondition
      (and
        (status busy)
        (enabled $agency-request)
        (inprogress $agency-request)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Agency)
          (and (not (at $0 $Agency)) (at $1 $Agency))
        )
      )
  )
  
  (:action do$query-fail-0
    :precondition
      (and
        (status busy)
        (enabled $query-fail-0)
        (inprogress $query-fail-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $AgencyMonitor)
          (and (not (at $0 $AgencyMonitor)) (at $2 $AgencyMonitor))
        )
        (when (at $1 $AgencyMonitor)
          (and (not (at $1 $AgencyMonitor)) (at $2 $AgencyMonitor))
        )
        (when (at $1 $ServiceMonitor-0)
          (and (not (at $1 $ServiceMonitor-0)) (at $4 $ServiceMonitor-0))
        )
        (when (at $11 $Service-0)
          (and (not (at $11 $Service-0)) (at $0 $Service-0))
        )
      )
  )
  
  (:action do$unavailable-0
    :precondition
      (and
        (status busy)
        (enabled $unavailable-0)
        (inprogress $unavailable-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Service-0)
          (and (not (at $1 $Service-0)) (at $11 $Service-0))
        )
      )
  )
  
  (:action do$agency-succ
    :precondition
      (and
        (status busy)
        (enabled $agency-succ)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $1 $AgencyMonitor)
          (and (not (at $1 $AgencyMonitor)) (at $0 $AgencyMonitor))
        )
        (when (at $2 $AgencyMonitor)
          (and (not (at $2 $AgencyMonitor)) (at $0 $AgencyMonitor))
        )
        (when (at $0 $ServiceMonitor-0)
          (and (not (at $0 $ServiceMonitor-0)) (at $-1 $ServiceMonitor-0))
        )
        (when (at $1 $ServiceMonitor-0)
          (and (not (at $1 $ServiceMonitor-0)) (at $-1 $ServiceMonitor-0))
        )
        (when (at $2 $ServiceMonitor-0)
          (and (not (at $2 $ServiceMonitor-0)) (at $-1 $ServiceMonitor-0))
        )
        (when (at $3 $ServiceMonitor-0)
          (and (not (at $3 $ServiceMonitor-0)) (at $0 $ServiceMonitor-0))
        )
        (when (at $4 $ServiceMonitor-0)
          (and (not (at $4 $ServiceMonitor-0)) (at $-1 $ServiceMonitor-0))
        )
        (when (at $5 $Service-0)
          (and (not (at $5 $Service-0)) (at $0 $Service-0))
        )
        (when (at $7 $Service-0)
          (and (not (at $7 $Service-0)) (at $0 $Service-0))
        )
        (when (at $1 $Agency)
          (and (not (at $1 $Agency)) (at $0 $Agency))
        )
      )
  )
  
  (:action do$query-0
    :precondition
      (and
        (status busy)
        (enabled $query-0)
        (inprogress $query-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $ServiceMonitor-0)
          (and (not (at $0 $ServiceMonitor-0)) (at $1 $ServiceMonitor-0))
        )
        (when (at $0 $Service-0)
          (and (not (at $0 $Service-0)) (at $1 $Service-0))
        )
      )
  )
  
  (:action do$committed-0
    :precondition
      (and
        (status busy)
        (enabled $committed-0)
        (inprogress $committed-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $4 $Service-0)
          (and (not (at $4 $Service-0)) (at $7 $Service-0))
        )
      )
  )
  
  (:action do$cancel-0
    :precondition
      (and
        (status busy)
        (enabled $cancel-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $ServiceMonitor-0)
          (and (not (at $2 $ServiceMonitor-0)) (at $4 $ServiceMonitor-0))
        )
        (when (at $5 $Service-0)
          (and (not (at $5 $Service-0)) (at $0 $Service-0))
        )
        (when (at $7 $Service-0)
          (and (not (at $7 $Service-0)) (at $0 $Service-0))
        )
      )
  )
  
  (:action do$purchase-0
    :precondition
      (and
        (status busy)
        (enabled $purchase-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Service-0)
          (and (not (at $5 $Service-0)) (at $6 $Service-0))
        )
        (when (at $7 $Service-0)
          (and (not (at $7 $Service-0)) (at $8 $Service-0))
        )
      )
  )
  
  (:action do$agency-fail
    :precondition
      (and
        (status busy)
        (enabled $agency-fail)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $0 $AgencyMonitor)
          (and (not (at $0 $AgencyMonitor)) (at $-1 $AgencyMonitor))
        )
        (when (at $1 $AgencyMonitor)
          (and (not (at $1 $AgencyMonitor)) (at $-1 $AgencyMonitor))
        )
        (when (at $2 $AgencyMonitor)
          (and (not (at $2 $AgencyMonitor)) (at $0 $AgencyMonitor))
        )
        (when (at $1 $ServiceMonitor-0)
          (and (not (at $1 $ServiceMonitor-0)) (at $0 $ServiceMonitor-0))
        )
        (when (at $2 $ServiceMonitor-0)
          (and (not (at $2 $ServiceMonitor-0)) (at $0 $ServiceMonitor-0))
        )
        (when (at $3 $ServiceMonitor-0)
          (and (not (at $3 $ServiceMonitor-0)) (at $0 $ServiceMonitor-0))
        )
        (when (at $4 $ServiceMonitor-0)
          (and (not (at $4 $ServiceMonitor-0)) (at $0 $ServiceMonitor-0))
        )
        (when (at $5 $Service-0)
          (and (not (at $5 $Service-0)) (at $0 $Service-0))
        )
        (when (at $7 $Service-0)
          (and (not (at $7 $Service-0)) (at $0 $Service-0))
        )
        (when (at $1 $Agency)
          (and (not (at $1 $Agency)) (at $0 $Agency))
        )
      )
  )
  
  (:action do$steps-0-1
    :precondition
      (and
        (status busy)
        (enabled $steps-0-1)
        (inprogress $steps-0-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Service-0)
          (and (not (at $2 $Service-0)) (at $9 $Service-0))
        )
      )
  )
  
  (:action do$available-0
    :precondition
      (and
        (status busy)
        (enabled $available-0)
        (inprogress $available-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Service-0)
          (and (not (at $1 $Service-0)) (at $2 $Service-0))
        )
      )
  )
  
  (:action do$steps-0-0
    :precondition
      (and
        (status busy)
        (enabled $steps-0-0)
        (inprogress $steps-0-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Service-0)
          (and (not (at $2 $Service-0)) (at $3 $Service-0))
        )
      )
  )
  
  (:action do$select-0
    :precondition
      (and
        (status busy)
        (enabled $select-0)
        (inprogress $select-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $10 $Service-0)
          (and (not (at $10 $Service-0)) (at $4 $Service-0))
        )
      )
  )
  
  (:action do$uncommitted-0
    :precondition
      (and
        (status busy)
        (enabled $uncommitted-0)
        (inprogress $uncommitted-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $AgencyMonitor)
          (and (not (at $0 $AgencyMonitor)) (at $1 $AgencyMonitor))
        )
        (when (at $1 $AgencyMonitor)
          (and (not (at $1 $AgencyMonitor)) (at $2 $AgencyMonitor))
        )
        (when (at $4 $Service-0)
          (and (not (at $4 $Service-0)) (at $5 $Service-0))
        )
      )
  )
  
  (:action do$query-succ-0
    :precondition
      (and
        (status busy)
        (enabled $query-succ-0)
        (inprogress $query-succ-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $ServiceMonitor-0)
          (and (not (at $1 $ServiceMonitor-0)) (at $2 $ServiceMonitor-0))
        )
        (when (at $3 $Service-0)
          (and (not (at $3 $Service-0)) (at $4 $Service-0))
        )
        (when (at $9 $Service-0)
          (and (not (at $9 $Service-0)) (at $10 $Service-0))
        )
      )
  )
  
  (:action do$purchase-fail-0
    :precondition
      (and
        (status busy)
        (enabled $purchase-fail-0)
        (inprogress $purchase-fail-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $AgencyMonitor)
          (and (not (at $1 $AgencyMonitor)) (at $2 $AgencyMonitor))
        )
        (when (at $2 $ServiceMonitor-0)
          (and (not (at $2 $ServiceMonitor-0)) (at $4 $ServiceMonitor-0))
        )
        (when (at $6 $Service-0)
          (and (not (at $6 $Service-0)) (at $0 $Service-0))
        )
      )
  )
  
  (:action do$purchase-succ-0
    :precondition
      (and
        (status busy)
        (enabled $purchase-succ-0)
        (inprogress $purchase-succ-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $ServiceMonitor-0)
          (and (not (at $2 $ServiceMonitor-0)) (at $3 $ServiceMonitor-0))
        )
        (when (at $6 $Service-0)
          (and (not (at $6 $Service-0)) (at $0 $Service-0))
        )
        (when (at $8 $Service-0)
          (and (not (at $8 $Service-0)) (at $0 $Service-0))
        )
      )
  )
)

