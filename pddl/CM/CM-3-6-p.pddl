(define
  (problem Goal)
  (:domain DirectedController)
  (:init
    (at $0 $Mouse-0)
    (at $0 $Cat-2)
    (at $0 $Cat-1)
    (at $0 $Cat-0)
    (at $0 $Mouse-2)
    (at $0 $Mouse-1)
  )
  (:goal
    (and
      (status event)
      (hoop $Mouse-0)
      (hoop $Cat-2)
      (hoop $Cat-1)
      (hoop $Cat-0)
      (hoop $Mouse-2)
      (hoop $Mouse-1)
    )
  )
)
