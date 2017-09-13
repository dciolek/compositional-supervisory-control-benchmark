(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Philosopher-0)
    (at $0 $Fork-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Philosopher-0)
      (hoop $Fork-0)
    )
  )
)
