(define
  (domain Controller)
  
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
    $Airplane-1 $HeightMonitor-0 $RampMonitor $ResponseMonitor $Airplane-0 - LTS
    $-1 $0 $1 $2 $3 $4 - State
    $air-crash-0 $approach-1 $approach-0 $land-1 $land-0 $land-crash $requestLand-0 $requestLand-1 $descend-1-0 $end $descend-0-0 - Label
    setup idle busy uncontrollable complete looping event - Phase
  )
  
  (:predicates
    (at ?s - State ?m - LTS)
    (marked ?s - State ?m - LTS)
    (hoop ?m - LTS)
    (ready ?a - Label ?m - LTS)
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
        (not (enabled $air-crash-0))
        (not (enabled $approach-1))
        (not (enabled $approach-0))
        (not (enabled $land-1))
        (not (enabled $land-0))
        (not (enabled $land-crash))
        (not (enabled $requestLand-0))
        (not (enabled $requestLand-1))
        (not (enabled $descend-1-0))
        (not (enabled $end))
        (not (enabled $descend-0-0))
        (not (inprogress $air-crash-0))
        (not (inprogress $land-1))
        (not (inprogress $land-0))
        (not (inprogress $requestLand-0))
        (not (inprogress $land-crash))
        (not (inprogress $requestLand-1))
        (not (inprogress $end))
        (not (ready $approach-1 $Airplane-1))
        (not (ready $land-1 $Airplane-1))
        (not (ready $requestLand-1 $Airplane-1))
        (not (ready $descend-1-0 $Airplane-1))
        (not (ready $end $Airplane-1))
        (not (ready $air-crash-0 $HeightMonitor-0))
        (not (ready $land-1 $HeightMonitor-0))
        (not (ready $land-0 $HeightMonitor-0))
        (not (ready $descend-1-0 $HeightMonitor-0))
        (not (ready $descend-0-0 $HeightMonitor-0))
        (not (ready $approach-1 $RampMonitor))
        (not (ready $approach-0 $RampMonitor))
        (not (ready $land-1 $RampMonitor))
        (not (ready $land-0 $RampMonitor))
        (not (ready $land-crash $RampMonitor))
        (not (ready $approach-1 $ResponseMonitor))
        (not (ready $approach-0 $ResponseMonitor))
        (not (ready $requestLand-0 $ResponseMonitor))
        (not (ready $requestLand-1 $ResponseMonitor))
        (not (ready $descend-1-0 $ResponseMonitor))
        (not (ready $descend-0-0 $ResponseMonitor))
        (not (ready $approach-0 $Airplane-0))
        (not (ready $land-0 $Airplane-0))
        (not (ready $requestLand-0 $Airplane-0))
        (not (ready $end $Airplane-0))
        (not (ready $descend-0-0 $Airplane-0))
        (not (hoop $Airplane-1))
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
        (when (at $0 $Airplane-1)
          (ready $requestLand-1 $Airplane-1)
        )
        (when (at $1 $Airplane-1)
          (ready $descend-1-0 $Airplane-1)
        )
        (when (at $2 $Airplane-1)
          (ready $approach-1 $Airplane-1)
        )
        (when (at $3 $Airplane-1)
          (ready $land-1 $Airplane-1)
        )
        (when (at $4 $Airplane-1)
          (ready $end $Airplane-1)
        )
        (when (at $0 $HeightMonitor-0)
          (and
            (ready $descend-0-0 $HeightMonitor-0)
            (ready $descend-1-0 $HeightMonitor-0)
          )
        )
        (when (at $1 $HeightMonitor-0)
          (and
            (ready $descend-1-0 $HeightMonitor-0)
            (ready $land-0 $HeightMonitor-0)
            (ready $land-1 $HeightMonitor-0)
          )
        )
        (when (at $2 $HeightMonitor-0)
          (ready $air-crash-0 $HeightMonitor-0)
        )
        (when (at $3 $HeightMonitor-0)
          (and
            (ready $descend-0-0 $HeightMonitor-0)
            (ready $land-0 $HeightMonitor-0)
            (ready $land-1 $HeightMonitor-0)
          )
        )
        (when (at $4 $HeightMonitor-0)
          (ready $air-crash-0 $HeightMonitor-0)
        )
        (when (at $0 $RampMonitor)
          (and
            (ready $approach-1 $RampMonitor)
            (ready $approach-0 $RampMonitor)
          )
        )
        (when (at $1 $RampMonitor)
          (and
            (ready $approach-1 $RampMonitor)
            (ready $approach-0 $RampMonitor)
            (ready $land-0 $RampMonitor)
            (ready $land-1 $RampMonitor)
          )
        )
        (when (at $2 $RampMonitor)
          (ready $land-crash $RampMonitor)
        )
        (when (at $3 $RampMonitor)
          (ready $land-crash $RampMonitor)
        )
        (when (at $0 $ResponseMonitor)
          (and
            (ready $requestLand-1 $ResponseMonitor)
            (ready $requestLand-0 $ResponseMonitor)
            (ready $approach-1 $ResponseMonitor)
            (ready $descend-0-0 $ResponseMonitor)
            (ready $descend-1-0 $ResponseMonitor)
            (ready $approach-0 $ResponseMonitor)
          )
        )
        (when (at $1 $ResponseMonitor)
          (ready $descend-1-0 $ResponseMonitor)
        )
        (when (at $2 $ResponseMonitor)
          (ready $descend-0-0 $ResponseMonitor)
        )
        (when (at $0 $Airplane-0)
          (ready $requestLand-0 $Airplane-0)
        )
        (when (at $1 $Airplane-0)
          (ready $descend-0-0 $Airplane-0)
        )
        (when (at $2 $Airplane-0)
          (ready $approach-0 $Airplane-0)
        )
        (when (at $3 $Airplane-0)
          (ready $land-0 $Airplane-0)
        )
        (when (at $4 $Airplane-0)
          (ready $end $Airplane-0)
        )
        (when (and (at $0 $Airplane-1) (marked $0 $Airplane-1))
          (hoop $Airplane-1)
        )
        (when (and (at $1 $Airplane-1) (marked $1 $Airplane-1))
          (hoop $Airplane-1)
        )
        (when (and (at $2 $Airplane-1) (marked $2 $Airplane-1))
          (hoop $Airplane-1)
        )
        (when (and (at $3 $Airplane-1) (marked $3 $Airplane-1))
          (hoop $Airplane-1)
        )
        (when (and (at $4 $Airplane-1) (marked $4 $Airplane-1))
          (hoop $Airplane-1)
        )
        (when (and (at $-1 $HeightMonitor-0) (marked $-1 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $0 $HeightMonitor-0) (marked $0 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $1 $HeightMonitor-0) (marked $1 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $2 $HeightMonitor-0) (marked $2 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $3 $HeightMonitor-0) (marked $3 $HeightMonitor-0))
          (hoop $HeightMonitor-0)
        )
        (when (and (at $4 $HeightMonitor-0) (marked $4 $HeightMonitor-0))
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
        (when (and (at $3 $RampMonitor) (marked $3 $RampMonitor))
          (hoop $RampMonitor)
        )
        (when (and (at $0 $ResponseMonitor) (marked $0 $ResponseMonitor))
          (hoop $ResponseMonitor)
        )
        (when (and (at $1 $ResponseMonitor) (marked $1 $ResponseMonitor))
          (hoop $ResponseMonitor)
        )
        (when (and (at $2 $ResponseMonitor) (marked $2 $ResponseMonitor))
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
            (ready $air-crash-0 $HeightMonitor-0)
          )
          (and
            (enabled $air-crash-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $approach-1 $Airplane-1)
            (ready $approach-1 $RampMonitor)
            (ready $approach-1 $ResponseMonitor)
          )
          (enabled $approach-1)
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
            (ready $land-1 $Airplane-1)
            (ready $land-1 $HeightMonitor-0)
            (ready $land-1 $RampMonitor)
          )
          (and
            (enabled $land-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $land-0 $HeightMonitor-0)
            (ready $land-0 $RampMonitor)
            (ready $land-0 $Airplane-0)
          )
          (and
            (enabled $land-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $land-crash $RampMonitor)
          )
          (and
            (enabled $land-crash)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $requestLand-0 $ResponseMonitor)
            (ready $requestLand-0 $Airplane-0)
          )
          (and
            (enabled $requestLand-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $requestLand-1 $Airplane-1)
            (ready $requestLand-1 $ResponseMonitor)
          )
          (and
            (enabled $requestLand-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $descend-1-0 $Airplane-1)
            (ready $descend-1-0 $HeightMonitor-0)
            (ready $descend-1-0 $ResponseMonitor)
          )
          (enabled $descend-1-0)
        )
        (when
          (and
            (ready $end $Airplane-1)
            (ready $end $Airplane-0)
          )
          (and
            (enabled $end)
            (status uncontrollable)
          )
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
        (status uncontrollable)
      )
    :effect
      (and
        (not (status idle))
        (status busy)
        (oneof
          (when (enabled $air-crash-0) (inprogress $air-crash-0))
          (when (enabled $land-1) (inprogress $land-1))
          (when (enabled $land-0) (inprogress $land-0))
          (when (enabled $requestLand-0) (inprogress $requestLand-0))
          (when (enabled $land-crash) (inprogress $land-crash))
          (when (enabled $requestLand-1) (inprogress $requestLand-1))
          (when (enabled $end) (inprogress $end))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $air-crash-0))
        (not (inprogress $land-1))
        (not (inprogress $land-0))
        (not (inprogress $requestLand-0))
        (not (inprogress $land-crash))
        (not (inprogress $requestLand-1))
        (not (inprogress $end))
      )
    :effect
      (and
        (inprogress $air-crash-0)
        (inprogress $land-1)
        (inprogress $land-0)
        (inprogress $requestLand-0)
        (inprogress $land-crash)
        (inprogress $requestLand-1)
        (inprogress $end)
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
        (when (at $0 $Airplane-1) (marked $0 $Airplane-1))
        (when (at $1 $Airplane-1) (marked $1 $Airplane-1))
        (when (at $2 $Airplane-1) (marked $2 $Airplane-1))
        (when (at $3 $Airplane-1) (marked $3 $Airplane-1))
        (when (at $4 $Airplane-1) (marked $4 $Airplane-1))
        (when (at $-1 $HeightMonitor-0) (marked $-1 $HeightMonitor-0))
        (when (at $0 $HeightMonitor-0) (marked $0 $HeightMonitor-0))
        (when (at $1 $HeightMonitor-0) (marked $1 $HeightMonitor-0))
        (when (at $2 $HeightMonitor-0) (marked $2 $HeightMonitor-0))
        (when (at $3 $HeightMonitor-0) (marked $3 $HeightMonitor-0))
        (when (at $4 $HeightMonitor-0) (marked $4 $HeightMonitor-0))
        (when (at $-1 $RampMonitor) (marked $-1 $RampMonitor))
        (when (at $0 $RampMonitor) (marked $0 $RampMonitor))
        (when (at $1 $RampMonitor) (marked $1 $RampMonitor))
        (when (at $2 $RampMonitor) (marked $2 $RampMonitor))
        (when (at $3 $RampMonitor) (marked $3 $RampMonitor))
        (when (at $0 $ResponseMonitor) (marked $0 $ResponseMonitor))
        (when (at $1 $ResponseMonitor) (marked $1 $ResponseMonitor))
        (when (at $2 $ResponseMonitor) (marked $2 $ResponseMonitor))
        (when (at $0 $Airplane-0) (marked $0 $Airplane-0))
        (when (at $1 $Airplane-0) (marked $1 $Airplane-0))
        (when (at $2 $Airplane-0) (marked $2 $Airplane-0))
        (when (at $3 $Airplane-0) (marked $3 $Airplane-0))
        (when (at $4 $Airplane-0) (marked $4 $Airplane-0))
      )
  )
  
  (:action do$air-crash-0
    :precondition
      (and
        (status busy)
        (inprogress $air-crash-0)
        (enabled $air-crash-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $HeightMonitor-0)
          (and (not (at $2 $HeightMonitor-0)) (at $-1 $HeightMonitor-0))
        )
        (when (at $4 $HeightMonitor-0)
          (and (not (at $4 $HeightMonitor-0)) (at $-1 $HeightMonitor-0))
        )
      )
  )
  
  (:action do$approach-1
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $approach-1)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $2 $Airplane-1)
          (and (not (at $2 $Airplane-1)) (at $3 $Airplane-1))
        )
        (when (at $0 $RampMonitor)
          (and (not (at $0 $RampMonitor)) (at $1 $RampMonitor))
        )
        (when (at $1 $RampMonitor)
          (and (not (at $1 $RampMonitor)) (at $3 $RampMonitor))
        )
      )
  )
  
  (:action do$approach-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $approach-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $RampMonitor)
          (and (not (at $0 $RampMonitor)) (at $1 $RampMonitor))
        )
        (when (at $1 $RampMonitor)
          (and (not (at $1 $RampMonitor)) (at $2 $RampMonitor))
        )
        (when (at $2 $Airplane-0)
          (and (not (at $2 $Airplane-0)) (at $3 $Airplane-0))
        )
      )
  )
  
  (:action do$land-1
    :precondition
      (and
        (status busy)
        (inprogress $land-1)
        (enabled $land-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $3 $Airplane-1)
          (and (not (at $3 $Airplane-1)) (at $4 $Airplane-1))
        )
        (when (at $1 $HeightMonitor-0)
          (and (not (at $1 $HeightMonitor-0)) (at $0 $HeightMonitor-0))
        )
        (when (at $3 $HeightMonitor-0)
          (and (not (at $3 $HeightMonitor-0)) (at $0 $HeightMonitor-0))
        )
        (when (at $1 $RampMonitor)
          (and (not (at $1 $RampMonitor)) (at $0 $RampMonitor))
        )
      )
  )
  
  (:action do$land-0
    :precondition
      (and
        (status busy)
        (inprogress $land-0)
        (enabled $land-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $HeightMonitor-0)
          (and (not (at $1 $HeightMonitor-0)) (at $0 $HeightMonitor-0))
        )
        (when (at $3 $HeightMonitor-0)
          (and (not (at $3 $HeightMonitor-0)) (at $0 $HeightMonitor-0))
        )
        (when (at $1 $RampMonitor)
          (and (not (at $1 $RampMonitor)) (at $0 $RampMonitor))
        )
        (when (at $3 $Airplane-0)
          (and (not (at $3 $Airplane-0)) (at $4 $Airplane-0))
        )
      )
  )
  
  (:action do$land-crash
    :precondition
      (and
        (status busy)
        (inprogress $land-crash)
        (enabled $land-crash)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $RampMonitor)
          (and (not (at $2 $RampMonitor)) (at $-1 $RampMonitor))
        )
        (when (at $3 $RampMonitor)
          (and (not (at $3 $RampMonitor)) (at $-1 $RampMonitor))
        )
      )
  )
  
  (:action do$requestLand-0
    :precondition
      (and
        (status busy)
        (inprogress $requestLand-0)
        (enabled $requestLand-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $ResponseMonitor)
          (and (not (at $0 $ResponseMonitor)) (at $2 $ResponseMonitor))
        )
        (when (at $0 $Airplane-0)
          (and (not (at $0 $Airplane-0)) (at $1 $Airplane-0))
        )
      )
  )
  
  (:action do$requestLand-1
    :precondition
      (and
        (status busy)
        (inprogress $requestLand-1)
        (enabled $requestLand-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Airplane-1)
          (and (not (at $0 $Airplane-1)) (at $1 $Airplane-1))
        )
        (when (at $0 $ResponseMonitor)
          (and (not (at $0 $ResponseMonitor)) (at $1 $ResponseMonitor))
        )
      )
  )
  
  (:action do$descend-1-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $descend-1-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $1 $Airplane-1)
          (and (not (at $1 $Airplane-1)) (at $2 $Airplane-1))
        )
        (when (at $0 $HeightMonitor-0)
          (and (not (at $0 $HeightMonitor-0)) (at $3 $HeightMonitor-0))
        )
        (when (at $1 $HeightMonitor-0)
          (and (not (at $1 $HeightMonitor-0)) (at $2 $HeightMonitor-0))
        )
        (when (at $1 $ResponseMonitor)
          (and (not (at $1 $ResponseMonitor)) (at $0 $ResponseMonitor))
        )
      )
  )
  
  (:action do$end
    :precondition
      (and
        (status busy)
        (inprogress $end)
        (enabled $end)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $4 $Airplane-1)
          (and (not (at $4 $Airplane-1)) (at $0 $Airplane-1))
        )
        (when (at $4 $Airplane-0)
          (and (not (at $4 $Airplane-0)) (at $0 $Airplane-0))
        )
      )
  )
  
  (:action do$descend-0-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $descend-0-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $HeightMonitor-0)
          (and (not (at $0 $HeightMonitor-0)) (at $1 $HeightMonitor-0))
        )
        (when (at $3 $HeightMonitor-0)
          (and (not (at $3 $HeightMonitor-0)) (at $4 $HeightMonitor-0))
        )
        (when (at $2 $ResponseMonitor)
          (and (not (at $2 $ResponseMonitor)) (at $0 $ResponseMonitor))
        )
        (when (at $1 $Airplane-0)
          (and (not (at $1 $Airplane-0)) (at $2 $Airplane-0))
        )
      )
  )
)

