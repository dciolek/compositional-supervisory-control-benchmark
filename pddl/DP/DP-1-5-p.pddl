(define
  (problem Goal)
  (:domain DirectedController)
  (:init
    (at $0 $Philosopher-0)
    (at $0 $Monitor-0)
    (at $0 $Fork-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Philosopher-0)
      (hoop $Monitor-0)
      (hoop $Fork-0)
    )
  )
)
