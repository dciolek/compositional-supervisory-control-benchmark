(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Mouse-0)
    (at $0 $Cat-0)
    (at $0 $Monitor)
  )
  (:goal
    (and
      (status event)
      (hoop $Mouse-0)
      (hoop $Cat-0)
      (hoop $Monitor)
    )
  )
)
