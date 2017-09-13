(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Airplane-2)
    (at $0 $Airplane-1)
    (at $0 $Airplane-3)
    (at $0 $HeightMonitor-0)
    (at $0 $RampMonitor)
    (at $0 $ResponseMonitor)
    (at $0 $Airplane-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Airplane-2)
      (hoop $Airplane-1)
      (hoop $Airplane-3)
      (hoop $HeightMonitor-0)
      (hoop $RampMonitor)
      (hoop $ResponseMonitor)
      (hoop $Airplane-0)
    )
  )
)