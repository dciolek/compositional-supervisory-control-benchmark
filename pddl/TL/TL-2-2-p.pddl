(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Buffer-1)
    (at $0 $Machine-0)
    (at $0 $Machine-1)
    (at $0 $Buffer-2)
    (at $0 $TU)
  )
  (:goal
    (and
      (status event)
      (hoop $Buffer-1)
      (hoop $Machine-0)
      (hoop $Machine-1)
      (hoop $Buffer-2)
      (hoop $TU)
    )
  )
)
