(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $HeightMonitor-1)
    (at $0 $Airplane-2)
    (at $0 $Airplane-1)
    (at $0 $HeightMonitor-2)
    (at $0 $HeightMonitor-0)
    (at $0 $ResponseMonitor)
    (at $0 $RampMonitor)
    (at $0 $HeightMonitor-3)
    (at $0 $Airplane-0)
  )
  (:goal
    (and
      (status event)
      (hoop $HeightMonitor-1)
      (hoop $Airplane-2)
      (hoop $Airplane-1)
      (hoop $HeightMonitor-2)
      (hoop $HeightMonitor-0)
      (hoop $ResponseMonitor)
      (hoop $RampMonitor)
      (hoop $HeightMonitor-3)
      (hoop $Airplane-0)
    )
  )
)
