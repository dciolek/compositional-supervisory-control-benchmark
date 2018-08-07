(define
  (problem Goal)
  (:domain DirectedController)
  (:init
    (at $0 $HeightMonitor-1)
    (at $0 $Airplane-1)
    (at $0 $HeightMonitor-0)
    (at $0 $RampMonitor)
    (at $0 $ResponseMonitor)
    (at $0 $Airplane-0)
  )
  (:goal
    (and
      (status event)
      (hoop $HeightMonitor-1)
      (hoop $Airplane-1)
      (hoop $HeightMonitor-0)
      (hoop $RampMonitor)
      (hoop $ResponseMonitor)
      (hoop $Airplane-0)
    )
  )
)
