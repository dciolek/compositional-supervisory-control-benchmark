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
    $HeightMonitor-0 $RampMonitor $ResponseMonitor $Airplane-0 - LTS
    $-1 $0 $1 $2 $3 $4 - State
    $control-all $approach-0 $land-0 $land-crash $requestLand-0 $extendFlight-0 $descend-0-0 - Label
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
        (not (enabled $control-all))
        (not (enabled $approach-0))
        (not (enabled $land-0))
        (not (enabled $land-crash))
        (not (enabled $requestLand-0))
        (not (enabled $extendFlight-0))
        (not (enabled $descend-0-0))
        (not (inprogress $control-all))
        (not (inprogress $land-0))
        (not (inprogress $requestLand-0))
        (not (inprogress $land-crash))
        (not (inprogress $extendFlight-0))
        (not (ready $land-0 $HeightMonitor-0))
        (not (ready $descend-0-0 $HeightMonitor-0))
        (not (ready $approach-0 $RampMonitor))
        (not (ready $land-0 $RampMonitor))
        (not (ready $land-crash $RampMonitor))
        (not (ready $approach-0 $ResponseMonitor))
        (not (ready $requestLand-0 $ResponseMonitor))
        (not (ready $extendFlight-0 $ResponseMonitor))
        (not (ready $descend-0-0 $ResponseMonitor))
        (not (ready $approach-0 $Airplane-0))
        (not (ready $control-all $Airplane-0))
        (not (ready $land-0 $Airplane-0))
        (not (ready $requestLand-0 $Airplane-0))
        (not (ready $extendFlight-0 $Airplane-0))
        (not (ready $descend-0-0 $Airplane-0))
        (not (hoop $HeightMonitor-0))
        (not (hoop $RampMonitor))
        (not (hoop $ResponseMonitor))
        (not (hoop $Airplane-0))
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
        (when (at $0 $HeightMonitor-0)
          (ready $descend-0-0 $HeightMonitor-0)
        )
        (when (at $1 $HeightMonitor-0)
          (ready $land-0 $HeightMonitor-0)
        )
        (when (at $0 $RampMonitor)
          (ready $approach-0 $RampMonitor)
        )
        (when (at $1 $RampMonitor)
          (and
            (ready $approach-0 $RampMonitor)
            (ready $land-0 $RampMonitor)
          )
        )
        (when (at $2 $RampMonitor)
          (ready $land-crash $RampMonitor)
        )
        (when (at $0 $ResponseMonitor)
          (and
            (ready $extendFlight-0 $ResponseMonitor)
            (ready $requestLand-0 $ResponseMonitor)
            (ready $descend-0-0 $ResponseMonitor)
            (ready $approach-0 $ResponseMonitor)
          )
        )
        (when (at $1 $ResponseMonitor)
          (ready $descend-0-0 $ResponseMonitor)
        )
        (when (at $0 $Airplane-0)
          (and
            (ready $extendFlight-0 $Airplane-0)
            (ready $requestLand-0 $Airplane-0)
          )
        )
        (when (at $1 $Airplane-0)
          (ready $control-all $Airplane-0)
        )
        (when (at $2 $Airplane-0)
          (ready $descend-0-0 $Airplane-0)
        )
        (when (at $3 $Airplane-0)
          (ready $approach-0 $Airplane-0)
        )
        (when (at $4 $Airplane-0)
          (ready $land-0 $Airplane-0)
        )
        (when (and (at $0 $HeightMonitor-0) (marked $0 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $1 $HeightMonitor-0) (marked $1 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $-1 $RampMonitor) (marked $-1 $RampMonitor))
          (hoop $RampMonitor)
        )
        (when (and (at $0 $RampMonitor) (marked $0 $RampMonitor))
          (hoop $RampMonitor)
        )
        (when (and (at $1 $RampMonitor) (marked $1 $RampMonitor))
          (hoop $RampMonitor)
        )
        (when (and (at $2 $RampMonitor) (marked $2 $RampMonitor))
          (hoop $RampMonitor)
        )
        (when (and (at $0 $ResponseMonitor) (marked $0 $ResponseMonitor))
          (hoop $ResponseMonitor)
        )
        (when (and (at $1 $ResponseMonitor) (marked $1 $ResponseMonitor))
          (hoop $ResponseMonitor)
        )
        (when (and (at $0 $Airplane-0) (marked $0 $Airplane-0))
          (hoop $Airplane-0)
        )
        (when (and (at $1 $Airplane-0) (marked $1 $Airplane-0))
          (hoop $Airplane-0)
        )
        (when (and (at $2 $Airplane-0) (marked $2 $Airplane-0))
          (hoop $Airplane-0)
        )
        (when (and (at $3 $Airplane-0) (marked $3 $Airplane-0))
          (hoop $Airplane-0)
        )
        (when (and (at $4 $Airplane-0) (marked $4 $Airplane-0))
          (hoop $Airplane-0)
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
            (ready $control-all $Airplane-0)
          )
          (enabled $control-all)
        )
        (when
          (and
            (ready $approach-0 $RampMonitor)
            (ready $approach-0 $ResponseMonitor)
            (ready $approach-0 $Airplane-0)
          )
          (enabled $approach-0)
        )
        (when
          (and
            (ready $land-0 $HeightMonitor-0)
            (ready $land-0 $RampMonitor)
            (ready $land-0 $Airplane-0)
          )
          (enabled $land-0)
        )
        (when
          (and
            (ready $land-crash $RampMonitor)
          )
          (enabled $land-crash)
        )
        (when
          (and
            (ready $requestLand-0 $ResponseMonitor)
            (ready $requestLand-0 $Airplane-0)
          )
          (enabled $requestLand-0)
        )
        (when
          (and
            (ready $extendFlight-0 $ResponseMonitor)
            (ready $extendFlight-0 $Airplane-0)
          )
          (enabled $extendFlight-0)
        )
        (when
          (and
            (ready $descend-0-0 $HeightMonitor-0)
            (ready $descend-0-0 $ResponseMonitor)
            (ready $descend-0-0 $Airplane-0)
          )
          (enabled $descend-0-0)
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
          (when (enabled $control-all) (and (inprogress $control-all) (status uncontrollable)))
          (when (enabled $land-0) (and (inprogress $land-0) (status uncontrollable)))
          (when (enabled $requestLand-0) (and (inprogress $requestLand-0) (status uncontrollable)))
          (when (enabled $land-crash) (and (inprogress $land-crash) (status uncontrollable)))
          (when (enabled $extendFlight-0) (and (inprogress $extendFlight-0) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $control-all))
        (not (inprogress $land-0))
        (not (inprogress $requestLand-0))
        (not (inprogress $land-crash))
        (not (inprogress $extendFlight-0))
      )
    :effect
      (and
        (inprogress $control-all)
        (inprogress $land-0)
        (inprogress $requestLand-0)
        (inprogress $land-crash)
        (inprogress $extendFlight-0)
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
        (when (at $0 $HeightMonitor-0) (marked $0 $HeightMonitor-0))
        (when (at $1 $HeightMonitor-0) (marked $1 $HeightMonitor-0))
        (when (at $-1 $RampMonitor) (marked $-1 $RampMonitor))
        (when (at $0 $RampMonitor) (marked $0 $RampMonitor))
        (when (at $1 $RampMonitor) (marked $1 $RampMonitor))
        (when (at $2 $RampMonitor) (marked $2 $RampMonitor))
        (when (at $0 $ResponseMonitor) (marked $0 $ResponseMonitor))
        (when (at $1 $ResponseMonitor) (marked $1 $ResponseMonitor))
        (when (at $0 $Airplane-0) (marked $0 $Airplane-0))
        (when (at $1 $Airplane-0) (marked $1 $Airplane-0))
        (when (at $2 $Airplane-0) (marked $2 $Airplane-0))
        (when (at $3 $Airplane-0) (marked $3 $Airplane-0))
        (when (at $4 $Airplane-0) (marked $4 $Airplane-0))
      )
  )
  
  (:action do$control-all
    :precondition
      (and
        (status busy)
        (enabled $control-all)
        (inprogress $control-all)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $1 $Airplane-0)
          (and (not (at $1 $Airplane-0)) (at $0 $Airplane-0))
        )
      )
  )
  
  (:action do$approach-0
    :precondition
      (and
        (status busy)
        (enabled $approach-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $RampMonitor)
          (and (not (at $0 $RampMonitor)) (at $1 $RampMonitor))
        )
        (when (at $1 $RampMonitor)
          (and (not (at $1 $RampMonitor)) (at $2 $RampMonitor))
        )
        (when (at $3 $Airplane-0)
          (and (not (at $3 $Airplane-0)) (at $4 $Airplane-0))
        )
      )
  )
  
  (:action do$land-0
    :precondition
      (and
        (status busy)
        (enabled $land-0)
        (inprogress $land-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $HeightMonitor-0)
          (and (not (at $1 $HeightMonitor-0)) (at $0 $HeightMonitor-0))
        )
        (when (at $1 $RampMonitor)
          (and (not (at $1 $RampMonitor)) (at $0 $RampMonitor))
        )
        (when (at $4 $Airplane-0)
          (and (not (at $4 $Airplane-0)) (at $1 $Airplane-0))
        )
      )
  )
  
  (:action do$land-crash
    :precondition
      (and
        (status busy)
        (enabled $land-crash)
        (inprogress $land-crash)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $RampMonitor)
          (and (not (at $2 $RampMonitor)) (at $-1 $RampMonitor))
        )
      )
  )
  
  (:action do$requestLand-0
    :precondition
      (and
        (status busy)
        (enabled $requestLand-0)
        (inprogress $requestLand-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $ResponseMonitor)
          (and (not (at $0 $ResponseMonitor)) (at $1 $ResponseMonitor))
        )
        (when (at $0 $Airplane-0)
          (and (not (at $0 $Airplane-0)) (at $2 $Airplane-0))
        )
      )
  )
  
  (:action do$extendFlight-0
    :precondition
      (and
        (status busy)
        (enabled $extendFlight-0)
        (inprogress $extendFlight-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Airplane-0)
          (and (not (at $0 $Airplane-0)) (at $1 $Airplane-0))
        )
      )
  )
  
  (:action do$descend-0-0
    :precondition
      (and
        (status busy)
        (enabled $descend-0-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $HeightMonitor-0)
          (and (not (at $0 $HeightMonitor-0)) (at $1 $HeightMonitor-0))
        )
        (when (at $1 $ResponseMonitor)
          (and (not (at $1 $ResponseMonitor)) (at $0 $ResponseMonitor))
        )
        (when (at $2 $Airplane-0)
          (and (not (at $2 $Airplane-0)) (at $3 $Airplane-0))
        )
      )
  )
)

