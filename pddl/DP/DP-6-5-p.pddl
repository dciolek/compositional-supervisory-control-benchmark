(define
  (problem Goal)
  (:domain Controller)
  (:init
    (at $0 $Fork-5)
    (at $0 $Philosopher-0)
    (at $0 $Philosopher-5)
    (at $0 $Philosopher-1)
    (at $0 $Philosopher-2)
    (at $0 $Fork-3)
    (at $0 $Fork-2)
    (at $0 $Philosopher-4)
    (at $0 $Fork-0)
    (at $0 $Fork-1)
    (at $0 $Philosopher-3)
    (at $0 $Fork-4)
  )
  (:goal
    (and
      (status event)
      (hoop $Fork-5)
      (hoop $Philosopher-0)
      (hoop $Philosopher-5)
      (hoop $Philosopher-1)
      (hoop $Philosopher-2)
      (hoop $Fork-3)
      (hoop $Fork-2)
      (hoop $Philosopher-4)
      (hoop $Fork-0)
      (hoop $Fork-1)
      (hoop $Philosopher-3)
      (hoop $Fork-4)
    )
  )
)
