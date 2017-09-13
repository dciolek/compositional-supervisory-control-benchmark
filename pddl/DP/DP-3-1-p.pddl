(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Philosopher-0)
    (at $0 $Philosopher-1)
    (at $0 $Philosopher-2)
    (at $0 $Fork-2)
    (at $0 $Fork-1)
    (at $0 $Fork-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Philosopher-0)
      (hoop $Philosopher-1)
      (hoop $Philosopher-2)
      (hoop $Fork-2)
      (hoop $Fork-1)
      (hoop $Fork-0)
    )
  )
)
