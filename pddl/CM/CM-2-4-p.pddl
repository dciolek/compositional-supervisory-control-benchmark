(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Mouse-0)
    (at $0 $Cat-1)
    (at $0 $Cat-0)
    (at $0 $Monitor)
    (at $0 $Mouse-1)
  )
  (:goal
    (and
      (status event)
      (hoop $Mouse-0)
      (hoop $Cat-1)
      (hoop $Cat-0)
      (hoop $Monitor)
      (hoop $Mouse-1)
    )
  )
)
