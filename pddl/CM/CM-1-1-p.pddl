(define
  (problem Goal)
  (:domain DirectedController)
  (:init
    (at $0 $Mouse-0)
    (at $0 $Cat-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Mouse-0)
      (hoop $Cat-0)
    )
  )
)
