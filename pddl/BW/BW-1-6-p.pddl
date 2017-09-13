(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Document)
    (at $0 $Crew-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Document)
      (hoop $Crew-0)
    )
  )
)
