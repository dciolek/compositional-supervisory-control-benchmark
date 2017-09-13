(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Service-1)
    (at $0 $AgencyMonitor)
    (at $0 $ServiceMonitor-0)
    (at $0 $Service-0)
    (at $0 $Agency)
    (at $0 $ServiceMonitor-1)
  )
  (:goal
    (and
      (status event)
      (hoop $Service-1)
      (hoop $AgencyMonitor)
      (hoop $ServiceMonitor-0)
      (hoop $Service-0)
      (hoop $Agency)
      (hoop $ServiceMonitor-1)
    )
  )
)
