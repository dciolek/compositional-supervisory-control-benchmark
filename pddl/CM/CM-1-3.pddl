(define
  (domain Controller)
  
  (:requirements
    :typing
    :non-deterministic
    :conditional-effects
  )
  
  (:types
    LTS
    State
    Label
    Phase
  )
  
  (:constants
    $Mouse-0 $Cat-0 $Monitor - LTS
    $-1 $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21 - State
    $mouse-0-move-6 $cat-turn $cat-0-move-3 $mouse-0-move-5 $cat-0-move-4 $mouse-0-move-4 $mouse-0-move-3 $cat-0-move-5 $mouse-turn $mouse-0-move-2 $cat-0-move-6 $mouse-0-move-1 $mouse-0-move-0 $cat-0-move-0 $end $cat-0-move-1 $cat-0-move-2 - Label
    setup idle busy uncontrollable complete looping event - Phase
  )
  
  (:predicates
    (at ?s - State ?m - LTS)
    (marked ?s - State ?m - LTS)
    (hoop ?m - LTS)
    (ready ?a - Label ?m - LTS)
    (enabled ?a - Label)
    (inprogress ?a - Label)
    (status ?c - Phase)
  )
  
  (:action reset
    :precondition
      (and
        (not (status setup))
        (not (status idle))
        (not (status busy))
      )
    :effect
      (and
        (status setup)
        (not (status uncontrollable))
        (not (status complete))
        (not (enabled $mouse-0-move-6))
        (not (enabled $cat-turn))
        (not (enabled $cat-0-move-3))
        (not (enabled $mouse-0-move-5))
        (not (enabled $cat-0-move-4))
        (not (enabled $mouse-0-move-4))
        (not (enabled $mouse-0-move-3))
        (not (enabled $cat-0-move-5))
        (not (enabled $mouse-turn))
        (not (enabled $mouse-0-move-2))
        (not (enabled $cat-0-move-6))
        (not (enabled $mouse-0-move-1))
        (not (enabled $mouse-0-move-0))
        (not (enabled $cat-0-move-0))
        (not (enabled $end))
        (not (enabled $cat-0-move-1))
        (not (enabled $cat-0-move-2))
        (not (inprogress $cat-0-move-3))
        (not (inprogress $cat-0-move-4))
        (not (inprogress $cat-0-move-5))
        (not (inprogress $cat-0-move-6))
        (not (inprogress $cat-0-move-0))
        (not (inprogress $cat-0-move-1))
        (not (inprogress $end))
        (not (inprogress $cat-0-move-2))
        (not (ready $mouse-0-move-6 $Mouse-0))
        (not (ready $cat-turn $Mouse-0))
        (not (ready $mouse-0-move-5 $Mouse-0))
        (not (ready $mouse-0-move-4 $Mouse-0))
        (not (ready $mouse-turn $Mouse-0))
        (not (ready $mouse-0-move-3 $Mouse-0))
        (not (ready $mouse-0-move-2 $Mouse-0))
        (not (ready $mouse-0-move-1 $Mouse-0))
        (not (ready $mouse-0-move-0 $Mouse-0))
        (not (ready $end $Mouse-0))
        (not (ready $cat-turn $Cat-0))
        (not (ready $cat-0-move-3 $Cat-0))
        (not (ready $cat-0-move-4 $Cat-0))
        (not (ready $mouse-turn $Cat-0))
        (not (ready $cat-0-move-5 $Cat-0))
        (not (ready $cat-0-move-6 $Cat-0))
        (not (ready $cat-0-move-0 $Cat-0))
        (not (ready $cat-0-move-1 $Cat-0))
        (not (ready $cat-0-move-2 $Cat-0))
        (not (ready $mouse-0-move-6 $Monitor))
        (not (ready $mouse-0-move-5 $Monitor))
        (not (ready $cat-0-move-3 $Monitor))
        (not (ready $cat-0-move-4 $Monitor))
        (not (ready $mouse-0-move-4 $Monitor))
        (not (ready $cat-0-move-5 $Monitor))
        (not (ready $mouse-0-move-3 $Monitor))
        (not (ready $cat-0-move-6 $Monitor))
        (not (ready $mouse-0-move-2 $Monitor))
        (not (ready $mouse-0-move-1 $Monitor))
        (not (ready $mouse-0-move-0 $Monitor))
        (not (ready $cat-0-move-0 $Monitor))
        (not (ready $cat-0-move-1 $Monitor))
        (not (ready $cat-0-move-2 $Monitor))
        (not (hoop $Mouse-0))
        (not (hoop $Cat-0))
        (not (hoop $Monitor))
      )
  )
  
  (:action setReady
    :precondition
      (and
        (status setup)
        (not (status busy))
      )
    :effect
      (and
        (status busy)
        (when (at $0 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $1 $Mouse-0)
          (ready $mouse-0-move-5 $Mouse-0)
        )
        (when (at $2 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $3 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $4 $Mouse-0)
          (and
            (ready $mouse-0-move-4 $Mouse-0)
            (ready $mouse-0-move-6 $Mouse-0)
          )
        )
        (when (at $5 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $6 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $7 $Mouse-0)
          (and
            (ready $mouse-0-move-5 $Mouse-0)
            (ready $mouse-0-move-3 $Mouse-0)
          )
        )
        (when (at $8 $Mouse-0)
          (and
            (ready $end $Mouse-0)
            (ready $cat-turn $Mouse-0)
          )
        )
        (when (at $9 $Mouse-0)
          (ready $end $Mouse-0)
        )
        (when (at $10 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $11 $Mouse-0)
          (and
            (ready $mouse-0-move-4 $Mouse-0)
            (ready $mouse-0-move-2 $Mouse-0)
          )
        )
        (when (at $12 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $13 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $14 $Mouse-0)
          (and
            (ready $mouse-0-move-3 $Mouse-0)
            (ready $mouse-0-move-1 $Mouse-0)
          )
        )
        (when (at $15 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $17 $Mouse-0)
          (and
            (ready $mouse-0-move-0 $Mouse-0)
            (ready $mouse-0-move-2 $Mouse-0)
          )
        )
        (when (at $16 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $19 $Mouse-0)
          (ready $mouse-turn $Mouse-0)
        )
        (when (at $18 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $21 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $20 $Mouse-0)
          (ready $mouse-0-move-1 $Mouse-0)
        )
        (when (at $0 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $1 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $2 $Cat-0)
          (ready $cat-0-move-1 $Cat-0)
        )
        (when (at $3 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $4 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $5 $Cat-0)
          (and
            (ready $cat-0-move-2 $Cat-0)
            (ready $cat-0-move-0 $Cat-0)
          )
        )
        (when (at $6 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $7 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $8 $Cat-0)
          (and
            (ready $cat-0-move-3 $Cat-0)
            (ready $cat-0-move-1 $Cat-0)
          )
        )
        (when (at $9 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $10 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $11 $Cat-0)
          (and
            (ready $cat-0-move-4 $Cat-0)
            (ready $cat-0-move-2 $Cat-0)
          )
        )
        (when (at $12 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $13 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $14 $Cat-0)
          (and
            (ready $cat-0-move-5 $Cat-0)
            (ready $cat-0-move-3 $Cat-0)
          )
        )
        (when (at $15 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $17 $Cat-0)
          (and
            (ready $cat-0-move-4 $Cat-0)
            (ready $cat-0-move-6 $Cat-0)
          )
        )
        (when (at $16 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $19 $Cat-0)
          (ready $cat-turn $Cat-0)
        )
        (when (at $18 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $20 $Cat-0)
          (ready $cat-0-move-5 $Cat-0)
        )
        (when (at $0 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (at $1 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (at $2 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (at $3 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (at $4 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (at $5 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (at $6 $Monitor)
          (and
            (ready $cat-0-move-5 $Monitor)
            (ready $mouse-0-move-5 $Monitor)
            (ready $mouse-0-move-0 $Monitor)
            (ready $cat-0-move-4 $Monitor)
            (ready $cat-0-move-3 $Monitor)
            (ready $cat-0-move-2 $Monitor)
            (ready $cat-0-move-0 $Monitor)
            (ready $mouse-0-move-3 $Monitor)
            (ready $cat-0-move-1 $Monitor)
            (ready $mouse-0-move-4 $Monitor)
            (ready $mouse-0-move-1 $Monitor)
            (ready $cat-0-move-6 $Monitor)
            (ready $mouse-0-move-2 $Monitor)
            (ready $mouse-0-move-6 $Monitor)
          )
        )
        (when (and (at $0 $Mouse-0) (marked $0 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $1 $Mouse-0) (marked $1 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $2 $Mouse-0) (marked $2 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $3 $Mouse-0) (marked $3 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $4 $Mouse-0) (marked $4 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $5 $Mouse-0) (marked $5 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $6 $Mouse-0) (marked $6 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $7 $Mouse-0) (marked $7 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $8 $Mouse-0) (marked $8 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $9 $Mouse-0) (marked $9 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $10 $Mouse-0) (marked $10 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $11 $Mouse-0) (marked $11 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $12 $Mouse-0) (marked $12 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $13 $Mouse-0) (marked $13 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $14 $Mouse-0) (marked $14 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $15 $Mouse-0) (marked $15 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $17 $Mouse-0) (marked $17 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $16 $Mouse-0) (marked $16 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $19 $Mouse-0) (marked $19 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $18 $Mouse-0) (marked $18 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $21 $Mouse-0) (marked $21 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $20 $Mouse-0) (marked $20 $Mouse-0))
          (hoop $Mouse-0)
        )
        (when (and (at $0 $Cat-0) (marked $0 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $1 $Cat-0) (marked $1 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $2 $Cat-0) (marked $2 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $3 $Cat-0) (marked $3 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $4 $Cat-0) (marked $4 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $5 $Cat-0) (marked $5 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $6 $Cat-0) (marked $6 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $7 $Cat-0) (marked $7 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $8 $Cat-0) (marked $8 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $9 $Cat-0) (marked $9 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $10 $Cat-0) (marked $10 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $11 $Cat-0) (marked $11 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $12 $Cat-0) (marked $12 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $13 $Cat-0) (marked $13 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $14 $Cat-0) (marked $14 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $15 $Cat-0) (marked $15 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $17 $Cat-0) (marked $17 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $16 $Cat-0) (marked $16 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $19 $Cat-0) (marked $19 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $18 $Cat-0) (marked $18 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $20 $Cat-0) (marked $20 $Cat-0))
          (hoop $Cat-0)
        )
        (when (and (at $-1 $Monitor) (marked $-1 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $0 $Monitor) (marked $0 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $1 $Monitor) (marked $1 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $2 $Monitor) (marked $2 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $3 $Monitor) (marked $3 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $4 $Monitor) (marked $4 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $5 $Monitor) (marked $5 $Monitor))
          (hoop $Monitor)
        )
        (when (and (at $6 $Monitor) (marked $6 $Monitor))
          (hoop $Monitor)
        )
      )
  )
  
  (:action setEnabled
    :precondition
      (and
        (status setup)
        (status busy)
      )
    :effect
      (and
        (not (status setup))
        (not (status busy))
        (not (status event))
        (status idle)
        (when
          (and
            (ready $mouse-0-move-6 $Mouse-0)
            (ready $mouse-0-move-6 $Monitor)
          )
          (enabled $mouse-0-move-6)
        )
        (when
          (and
            (ready $cat-turn $Mouse-0)
            (ready $cat-turn $Cat-0)
          )
          (enabled $cat-turn)
        )
        (when
          (and
            (ready $cat-0-move-3 $Cat-0)
            (ready $cat-0-move-3 $Monitor)
          )
          (and
            (enabled $cat-0-move-3)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $mouse-0-move-5 $Mouse-0)
            (ready $mouse-0-move-5 $Monitor)
          )
          (enabled $mouse-0-move-5)
        )
        (when
          (and
            (ready $cat-0-move-4 $Cat-0)
            (ready $cat-0-move-4 $Monitor)
          )
          (and
            (enabled $cat-0-move-4)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $mouse-0-move-4 $Mouse-0)
            (ready $mouse-0-move-4 $Monitor)
          )
          (enabled $mouse-0-move-4)
        )
        (when
          (and
            (ready $mouse-0-move-3 $Mouse-0)
            (ready $mouse-0-move-3 $Monitor)
          )
          (enabled $mouse-0-move-3)
        )
        (when
          (and
            (ready $cat-0-move-5 $Cat-0)
            (ready $cat-0-move-5 $Monitor)
          )
          (and
            (enabled $cat-0-move-5)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $mouse-turn $Mouse-0)
            (ready $mouse-turn $Cat-0)
          )
          (enabled $mouse-turn)
        )
        (when
          (and
            (ready $mouse-0-move-2 $Mouse-0)
            (ready $mouse-0-move-2 $Monitor)
          )
          (enabled $mouse-0-move-2)
        )
        (when
          (and
            (ready $cat-0-move-6 $Cat-0)
            (ready $cat-0-move-6 $Monitor)
          )
          (and
            (enabled $cat-0-move-6)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $mouse-0-move-1 $Mouse-0)
            (ready $mouse-0-move-1 $Monitor)
          )
          (enabled $mouse-0-move-1)
        )
        (when
          (and
            (ready $mouse-0-move-0 $Mouse-0)
            (ready $mouse-0-move-0 $Monitor)
          )
          (enabled $mouse-0-move-0)
        )
        (when
          (and
            (ready $cat-0-move-0 $Cat-0)
            (ready $cat-0-move-0 $Monitor)
          )
          (and
            (enabled $cat-0-move-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $end $Mouse-0)
          )
          (and
            (enabled $end)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $cat-0-move-1 $Cat-0)
            (ready $cat-0-move-1 $Monitor)
          )
          (and
            (enabled $cat-0-move-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $cat-0-move-2 $Cat-0)
            (ready $cat-0-move-2 $Monitor)
          )
          (and
            (enabled $cat-0-move-2)
            (status uncontrollable)
          )
        )
      )
  )
  
  (:action pick
    :precondition
      (and
        (status idle)
        (status uncontrollable)
      )
    :effect
      (and
        (not (status idle))
        (status busy)
        (oneof
          (when (enabled $cat-0-move-3) (inprogress $cat-0-move-3))
          (when (enabled $cat-0-move-4) (inprogress $cat-0-move-4))
          (when (enabled $cat-0-move-5) (inprogress $cat-0-move-5))
          (when (enabled $cat-0-move-6) (inprogress $cat-0-move-6))
          (when (enabled $cat-0-move-0) (inprogress $cat-0-move-0))
          (when (enabled $cat-0-move-1) (inprogress $cat-0-move-1))
          (when (enabled $end) (inprogress $end))
          (when (enabled $cat-0-move-2) (inprogress $cat-0-move-2))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $cat-0-move-3))
        (not (inprogress $cat-0-move-4))
        (not (inprogress $cat-0-move-5))
        (not (inprogress $cat-0-move-6))
        (not (inprogress $cat-0-move-0))
        (not (inprogress $cat-0-move-1))
        (not (inprogress $end))
        (not (inprogress $cat-0-move-2))
      )
    :effect
      (and
        (inprogress $cat-0-move-3)
        (inprogress $cat-0-move-4)
        (inprogress $cat-0-move-5)
        (inprogress $cat-0-move-6)
        (inprogress $cat-0-move-0)
        (inprogress $cat-0-move-1)
        (inprogress $end)
        (inprogress $cat-0-move-2)
      )
  )
  
  (:action loop
    :precondition
      (and
        (status complete)
        (status event)
        (not (status looping))
      )
    :effect
      (and
        (not (status event))
        (status looping)
        (when (at $0 $Mouse-0) (marked $0 $Mouse-0))
        (when (at $1 $Mouse-0) (marked $1 $Mouse-0))
        (when (at $2 $Mouse-0) (marked $2 $Mouse-0))
        (when (at $3 $Mouse-0) (marked $3 $Mouse-0))
        (when (at $4 $Mouse-0) (marked $4 $Mouse-0))
        (when (at $5 $Mouse-0) (marked $5 $Mouse-0))
        (when (at $6 $Mouse-0) (marked $6 $Mouse-0))
        (when (at $7 $Mouse-0) (marked $7 $Mouse-0))
        (when (at $8 $Mouse-0) (marked $8 $Mouse-0))
        (when (at $9 $Mouse-0) (marked $9 $Mouse-0))
        (when (at $10 $Mouse-0) (marked $10 $Mouse-0))
        (when (at $11 $Mouse-0) (marked $11 $Mouse-0))
        (when (at $12 $Mouse-0) (marked $12 $Mouse-0))
        (when (at $13 $Mouse-0) (marked $13 $Mouse-0))
        (when (at $14 $Mouse-0) (marked $14 $Mouse-0))
        (when (at $15 $Mouse-0) (marked $15 $Mouse-0))
        (when (at $17 $Mouse-0) (marked $17 $Mouse-0))
        (when (at $16 $Mouse-0) (marked $16 $Mouse-0))
        (when (at $19 $Mouse-0) (marked $19 $Mouse-0))
        (when (at $18 $Mouse-0) (marked $18 $Mouse-0))
        (when (at $21 $Mouse-0) (marked $21 $Mouse-0))
        (when (at $20 $Mouse-0) (marked $20 $Mouse-0))
        (when (at $0 $Cat-0) (marked $0 $Cat-0))
        (when (at $1 $Cat-0) (marked $1 $Cat-0))
        (when (at $2 $Cat-0) (marked $2 $Cat-0))
        (when (at $3 $Cat-0) (marked $3 $Cat-0))
        (when (at $4 $Cat-0) (marked $4 $Cat-0))
        (when (at $5 $Cat-0) (marked $5 $Cat-0))
        (when (at $6 $Cat-0) (marked $6 $Cat-0))
        (when (at $7 $Cat-0) (marked $7 $Cat-0))
        (when (at $8 $Cat-0) (marked $8 $Cat-0))
        (when (at $9 $Cat-0) (marked $9 $Cat-0))
        (when (at $10 $Cat-0) (marked $10 $Cat-0))
        (when (at $11 $Cat-0) (marked $11 $Cat-0))
        (when (at $12 $Cat-0) (marked $12 $Cat-0))
        (when (at $13 $Cat-0) (marked $13 $Cat-0))
        (when (at $14 $Cat-0) (marked $14 $Cat-0))
        (when (at $15 $Cat-0) (marked $15 $Cat-0))
        (when (at $17 $Cat-0) (marked $17 $Cat-0))
        (when (at $16 $Cat-0) (marked $16 $Cat-0))
        (when (at $19 $Cat-0) (marked $19 $Cat-0))
        (when (at $18 $Cat-0) (marked $18 $Cat-0))
        (when (at $20 $Cat-0) (marked $20 $Cat-0))
        (when (at $-1 $Monitor) (marked $-1 $Monitor))
        (when (at $0 $Monitor) (marked $0 $Monitor))
        (when (at $1 $Monitor) (marked $1 $Monitor))
        (when (at $2 $Monitor) (marked $2 $Monitor))
        (when (at $3 $Monitor) (marked $3 $Monitor))
        (when (at $4 $Monitor) (marked $4 $Monitor))
        (when (at $5 $Monitor) (marked $5 $Monitor))
        (when (at $6 $Monitor) (marked $6 $Monitor))
      )
  )
  
  (:action do$mouse-0-move-6
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-6)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $4 $Mouse-0)
          (and (not (at $4 $Mouse-0)) (at $21 $Mouse-0))
        )
        (when (at $2 $Monitor)
          (and (not (at $2 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$cat-turn
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $cat-turn)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $2 $Mouse-0)
          (and (not (at $2 $Mouse-0)) (at $3 $Mouse-0))
        )
        (when (at $5 $Mouse-0)
          (and (not (at $5 $Mouse-0)) (at $6 $Mouse-0))
        )
        (when (at $8 $Mouse-0)
          (and (not (at $8 $Mouse-0)) (at $10 $Mouse-0))
        )
        (when (at $12 $Mouse-0)
          (and (not (at $12 $Mouse-0)) (at $13 $Mouse-0))
        )
        (when (at $15 $Mouse-0)
          (and (not (at $15 $Mouse-0)) (at $16 $Mouse-0))
        )
        (when (at $18 $Mouse-0)
          (and (not (at $18 $Mouse-0)) (at $19 $Mouse-0))
        )
        (when (at $21 $Mouse-0)
          (and (not (at $21 $Mouse-0)) (at $0 $Mouse-0))
        )
        (when (at $1 $Cat-0)
          (and (not (at $1 $Cat-0)) (at $2 $Cat-0))
        )
        (when (at $4 $Cat-0)
          (and (not (at $4 $Cat-0)) (at $5 $Cat-0))
        )
        (when (at $7 $Cat-0)
          (and (not (at $7 $Cat-0)) (at $8 $Cat-0))
        )
        (when (at $10 $Cat-0)
          (and (not (at $10 $Cat-0)) (at $11 $Cat-0))
        )
        (when (at $13 $Cat-0)
          (and (not (at $13 $Cat-0)) (at $14 $Cat-0))
        )
        (when (at $16 $Cat-0)
          (and (not (at $16 $Cat-0)) (at $17 $Cat-0))
        )
        (when (at $19 $Cat-0)
          (and (not (at $19 $Cat-0)) (at $20 $Cat-0))
        )
      )
  )
  
  (:action do$cat-0-move-3
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-3)
        (enabled $cat-0-move-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $8 $Cat-0)
          (and (not (at $8 $Cat-0)) (at $9 $Cat-0))
        )
        (when (at $14 $Cat-0)
          (and (not (at $14 $Cat-0)) (at $9 $Cat-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $5 $Monitor))
        )
        (when (at $1 $Monitor)
          (and (not (at $1 $Monitor)) (at $5 $Monitor))
        )
        (when (at $6 $Monitor)
          (and (not (at $6 $Monitor)) (at $5 $Monitor))
        )
      )
  )
  
  (:action do$mouse-0-move-5
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-5)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $1 $Mouse-0)
          (and (not (at $1 $Mouse-0)) (at $2 $Mouse-0))
        )
        (when (at $7 $Mouse-0)
          (and (not (at $7 $Mouse-0)) (at $2 $Mouse-0))
        )
        (when (at $3 $Monitor)
          (and (not (at $3 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$cat-0-move-4
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-4)
        (enabled $cat-0-move-4)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $11 $Cat-0)
          (and (not (at $11 $Cat-0)) (at $12 $Cat-0))
        )
        (when (at $17 $Cat-0)
          (and (not (at $17 $Cat-0)) (at $12 $Cat-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $4 $Monitor))
        )
        (when (at $1 $Monitor)
          (and (not (at $1 $Monitor)) (at $4 $Monitor))
        )
        (when (at $5 $Monitor)
          (and (not (at $5 $Monitor)) (at $4 $Monitor))
        )
        (when (at $6 $Monitor)
          (and (not (at $6 $Monitor)) (at $4 $Monitor))
        )
      )
  )
  
  (:action do$mouse-0-move-4
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-4)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $4 $Mouse-0)
          (and (not (at $4 $Mouse-0)) (at $5 $Mouse-0))
        )
        (when (at $11 $Mouse-0)
          (and (not (at $11 $Mouse-0)) (at $5 $Mouse-0))
        )
        (when (at $4 $Monitor)
          (and (not (at $4 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$mouse-0-move-3
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-3)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $7 $Mouse-0)
          (and (not (at $7 $Mouse-0)) (at $8 $Mouse-0))
        )
        (when (at $14 $Mouse-0)
          (and (not (at $14 $Mouse-0)) (at $8 $Mouse-0))
        )
        (when (at $5 $Monitor)
          (and (not (at $5 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$cat-0-move-5
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-5)
        (enabled $cat-0-move-5)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $14 $Cat-0)
          (and (not (at $14 $Cat-0)) (at $15 $Cat-0))
        )
        (when (at $20 $Cat-0)
          (and (not (at $20 $Cat-0)) (at $15 $Cat-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $3 $Monitor))
        )
        (when (at $1 $Monitor)
          (and (not (at $1 $Monitor)) (at $3 $Monitor))
        )
        (when (at $4 $Monitor)
          (and (not (at $4 $Monitor)) (at $3 $Monitor))
        )
        (when (at $5 $Monitor)
          (and (not (at $5 $Monitor)) (at $3 $Monitor))
        )
        (when (at $6 $Monitor)
          (and (not (at $6 $Monitor)) (at $3 $Monitor))
        )
      )
  )
  
  (:action do$mouse-turn
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-turn)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $Mouse-0)
          (and (not (at $0 $Mouse-0)) (at $1 $Mouse-0))
        )
        (when (at $3 $Mouse-0)
          (and (not (at $3 $Mouse-0)) (at $4 $Mouse-0))
        )
        (when (at $6 $Mouse-0)
          (and (not (at $6 $Mouse-0)) (at $7 $Mouse-0))
        )
        (when (at $10 $Mouse-0)
          (and (not (at $10 $Mouse-0)) (at $11 $Mouse-0))
        )
        (when (at $13 $Mouse-0)
          (and (not (at $13 $Mouse-0)) (at $14 $Mouse-0))
        )
        (when (at $16 $Mouse-0)
          (and (not (at $16 $Mouse-0)) (at $17 $Mouse-0))
        )
        (when (at $19 $Mouse-0)
          (and (not (at $19 $Mouse-0)) (at $20 $Mouse-0))
        )
        (when (at $0 $Cat-0)
          (and (not (at $0 $Cat-0)) (at $1 $Cat-0))
        )
        (when (at $3 $Cat-0)
          (and (not (at $3 $Cat-0)) (at $4 $Cat-0))
        )
        (when (at $6 $Cat-0)
          (and (not (at $6 $Cat-0)) (at $7 $Cat-0))
        )
        (when (at $9 $Cat-0)
          (and (not (at $9 $Cat-0)) (at $10 $Cat-0))
        )
        (when (at $12 $Cat-0)
          (and (not (at $12 $Cat-0)) (at $13 $Cat-0))
        )
        (when (at $15 $Cat-0)
          (and (not (at $15 $Cat-0)) (at $16 $Cat-0))
        )
        (when (at $18 $Cat-0)
          (and (not (at $18 $Cat-0)) (at $19 $Cat-0))
        )
      )
  )
  
  (:action do$mouse-0-move-2
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-2)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $11 $Mouse-0)
          (and (not (at $11 $Mouse-0)) (at $12 $Mouse-0))
        )
        (when (at $17 $Mouse-0)
          (and (not (at $17 $Mouse-0)) (at $12 $Mouse-0))
        )
        (when (at $1 $Monitor)
          (and (not (at $1 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$cat-0-move-6
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-6)
        (enabled $cat-0-move-6)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $17 $Cat-0)
          (and (not (at $17 $Cat-0)) (at $18 $Cat-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $2 $Monitor))
        )
        (when (at $1 $Monitor)
          (and (not (at $1 $Monitor)) (at $2 $Monitor))
        )
        (when (at $3 $Monitor)
          (and (not (at $3 $Monitor)) (at $2 $Monitor))
        )
        (when (at $4 $Monitor)
          (and (not (at $4 $Monitor)) (at $2 $Monitor))
        )
        (when (at $5 $Monitor)
          (and (not (at $5 $Monitor)) (at $2 $Monitor))
        )
        (when (at $6 $Monitor)
          (and (not (at $6 $Monitor)) (at $2 $Monitor))
        )
      )
  )
  
  (:action do$mouse-0-move-1
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-1)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $14 $Mouse-0)
          (and (not (at $14 $Mouse-0)) (at $15 $Mouse-0))
        )
        (when (at $20 $Mouse-0)
          (and (not (at $20 $Mouse-0)) (at $15 $Mouse-0))
        )
        (when (at $6 $Monitor)
          (and (not (at $6 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$mouse-0-move-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $mouse-0-move-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $17 $Mouse-0)
          (and (not (at $17 $Mouse-0)) (at $18 $Mouse-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $-1 $Monitor))
        )
      )
  )
  
  (:action do$cat-0-move-0
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-0)
        (enabled $cat-0-move-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Cat-0)
          (and (not (at $5 $Cat-0)) (at $0 $Cat-0))
        )
      )
  )
  
  (:action do$end
    :precondition
      (and
        (status busy)
        (inprogress $end)
        (enabled $end)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $8 $Mouse-0)
          (and (not (at $8 $Mouse-0)) (at $9 $Mouse-0))
        )
      )
  )
  
  (:action do$cat-0-move-1
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-1)
        (enabled $cat-0-move-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Cat-0)
          (and (not (at $2 $Cat-0)) (at $3 $Cat-0))
        )
        (when (at $8 $Cat-0)
          (and (not (at $8 $Cat-0)) (at $3 $Cat-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $6 $Monitor))
        )
      )
  )
  
  (:action do$cat-0-move-2
    :precondition
      (and
        (status busy)
        (inprogress $cat-0-move-2)
        (enabled $cat-0-move-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Cat-0)
          (and (not (at $5 $Cat-0)) (at $6 $Cat-0))
        )
        (when (at $11 $Cat-0)
          (and (not (at $11 $Cat-0)) (at $6 $Cat-0))
        )
        (when (at $0 $Monitor)
          (and (not (at $0 $Monitor)) (at $1 $Monitor))
        )
        (when (at $6 $Monitor)
          (and (not (at $6 $Monitor)) (at $1 $Monitor))
        )
      )
  )
)

