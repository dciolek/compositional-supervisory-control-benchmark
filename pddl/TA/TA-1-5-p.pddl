(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $AgencyMonitor)
    (at $0 $ServiceMonitor-0)
    (at $0 $Service-0)
    (at $0 $Agency)
  )
  (:goal
    (and
      (status event)
      (hoop $AgencyMonitor)
      (hoop $ServiceMonitor-0)
      (hoop $Service-0)
      (hoop $Agency)
    )
  )
)
