(define
  (problem Goal)
  (:domain DirectedController)
  (:init
    (at $0 $Document)
    (at $0 $Crew-1)
    (at $0 $Crew-2)
    (at $0 $Crew-0)
  )
  (:goal
    (and
      (status event)
      (hoop $Document)
      (hoop $Crew-1)
      (hoop $Crew-2)
      (hoop $Crew-0)
    )
  )
)
