(define
  (domain DirectedController)
  
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
    $Mouse-0 $Cat-0 - LTS
    $-1 $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 - State
    $safe $cat-turn $mouse-turn $mouse-0-move-2 $mouse-0-move-1 $mouse-0-move-0 $cat-0-move-0 $cat-0-move-1 $cat-0-move-2 - Label
    setup idle busy complete uncontrollable looping event - Phase
  )
  
  (:predicates
    (at ?s - State ?m - LTS)
    (ready ?a - Label ?m - LTS)
    (marked ?s - State ?m - LTS)
    (hoop ?m - LTS)
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
        (not (enabled $safe))
        (not (enabled $cat-turn))
        (not (enabled $mouse-turn))
        (not (enabled $mouse-0-move-2))
        (not (enabled $mouse-0-move-1))
        (not (enabled $mouse-0-move-0))
        (not (enabled $cat-0-move-0))
        (not (enabled $cat-0-move-1))
        (not (enabled $cat-0-move-2))
        (not (inprogress $safe))
        (not (inprogress $cat-turn))
        (not (inprogress $mouse-turn))
        (not (inprogress $cat-0-move-0))
        (not (inprogress $cat-0-move-1))
        (not (inprogress $cat-0-move-2))
        (not (ready $safe $Mouse-0))
        (not (ready $cat-turn $Mouse-0))
        (not (ready $mouse-turn $Mouse-0))
        (not (ready $mouse-0-move-2 $Mouse-0))
        (not (ready $mouse-0-move-1 $Mouse-0))
        (not (ready $cat-0-move-0 $Mouse-0))
        (not (ready $mouse-0-move-0 $Mouse-0))
        (not (ready $cat-0-move-1 $Mouse-0))
        (not (ready $cat-0-move-2 $Mouse-0))
        (not (ready $cat-turn $Cat-0))
        (not (ready $mouse-turn $Cat-0))
        (not (ready $mouse-0-move-2 $Cat-0))
        (not (ready $mouse-0-move-1 $Cat-0))
        (not (ready $mouse-0-move-0 $Cat-0))
        (not (ready $cat-0-move-0 $Cat-0))
        (not (ready $cat-0-move-1 $Cat-0))
        (not (ready $cat-0-move-2 $Cat-0))
        (not (hoop $Mouse-0))
        (not (hoop $Cat-0))
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
          (and
            (ready $cat-0-move-2 $Mouse-0)
            (ready $cat-0-move-0 $Mouse-0)
            (ready $cat-0-move-1 $Mouse-0)
            (ready $mouse-turn $Mouse-0)
          )
        )
        (when (at $1 $Mouse-0)
          (and
            (ready $mouse-0-move-1 $Mouse-0)
            (ready $mouse-0-move-2 $Mouse-0)
          )
        )
        (when (at $2 $Mouse-0)
          (ready $safe $Mouse-0)
        )
        (when (at $3 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $4 $Mouse-0)
          (and
            (ready $cat-0-move-2 $Mouse-0)
            (ready $cat-0-move-0 $Mouse-0)
            (ready $cat-0-move-1 $Mouse-0)
            (ready $mouse-turn $Mouse-0)
          )
        )
        (when (at $5 $Mouse-0)
          (and
            (ready $mouse-0-move-0 $Mouse-0)
            (ready $mouse-0-move-1 $Mouse-0)
            (ready $mouse-0-move-2 $Mouse-0)
          )
        )
        (when (at $6 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $7 $Mouse-0)
          (and
            (ready $cat-0-move-2 $Mouse-0)
            (ready $cat-0-move-0 $Mouse-0)
            (ready $cat-0-move-1 $Mouse-0)
            (ready $mouse-turn $Mouse-0)
          )
        )
        (when (at $8 $Mouse-0)
          (and
            (ready $mouse-0-move-0 $Mouse-0)
            (ready $mouse-0-move-1 $Mouse-0)
          )
        )
        (when (at $9 $Mouse-0)
          (ready $cat-turn $Mouse-0)
        )
        (when (at $0 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $1 $Cat-0)
          (and
            (ready $mouse-0-move-0 $Cat-0)
            (ready $cat-turn $Cat-0)
            (ready $mouse-0-move-1 $Cat-0)
            (ready $mouse-0-move-2 $Cat-0)
          )
        )
        (when (at $2 $Cat-0)
          (and
            (ready $cat-0-move-0 $Cat-0)
            (ready $cat-0-move-1 $Cat-0)
          )
        )
        (when (at $3 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $4 $Cat-0)
          (and
            (ready $mouse-0-move-0 $Cat-0)
            (ready $cat-turn $Cat-0)
            (ready $mouse-0-move-1 $Cat-0)
            (ready $mouse-0-move-2 $Cat-0)
          )
        )
        (when (at $5 $Cat-0)
          (and
            (ready $cat-0-move-2 $Cat-0)
            (ready $cat-0-move-0 $Cat-0)
            (ready $cat-0-move-1 $Cat-0)
          )
        )
        (when (at $6 $Cat-0)
          (ready $mouse-turn $Cat-0)
        )
        (when (at $7 $Cat-0)
          (and
            (ready $mouse-0-move-0 $Cat-0)
            (ready $cat-turn $Cat-0)
            (ready $mouse-0-move-1 $Cat-0)
            (ready $mouse-0-move-2 $Cat-0)
          )
        )
        (when (at $8 $Cat-0)
          (and
            (ready $cat-0-move-2 $Cat-0)
            (ready $cat-0-move-1 $Cat-0)
          )
        )
        (when (and (at $-1 $Mouse-0) (marked $-1 $Mouse-0))
          (hoop $Mouse-0)
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
        (when (and (at $-1 $Cat-0) (marked $-1 $Cat-0))
          (hoop $Cat-0)
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
            (ready $safe $Mouse-0)
          )
          (enabled $safe)
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
            (ready $mouse-turn $Mouse-0)
            (ready $mouse-turn $Cat-0)
          )
          (enabled $mouse-turn)
        )
        (when
          (and
            (ready $mouse-0-move-2 $Mouse-0)
            (ready $mouse-0-move-2 $Cat-0)
          )
          (enabled $mouse-0-move-2)
        )
        (when
          (and
            (ready $mouse-0-move-1 $Mouse-0)
            (ready $mouse-0-move-1 $Cat-0)
          )
          (enabled $mouse-0-move-1)
        )
        (when
          (and
            (ready $mouse-0-move-0 $Mouse-0)
            (ready $mouse-0-move-0 $Cat-0)
          )
          (enabled $mouse-0-move-0)
        )
        (when
          (and
            (ready $cat-0-move-0 $Mouse-0)
            (ready $cat-0-move-0 $Cat-0)
          )
          (enabled $cat-0-move-0)
        )
        (when
          (and
            (ready $cat-0-move-1 $Mouse-0)
            (ready $cat-0-move-1 $Cat-0)
          )
          (enabled $cat-0-move-1)
        )
        (when
          (and
            (ready $cat-0-move-2 $Mouse-0)
            (ready $cat-0-move-2 $Cat-0)
          )
          (enabled $cat-0-move-2)
        )
      )
  )
  
  (:action pick
    :precondition
      (and
        (status idle)
      )
    :effect
      (and
        (not (status idle))
        (status busy)
        (oneof
          (when (enabled $safe) (and (inprogress $safe) (status uncontrollable)))
          (when (enabled $cat-turn) (and (inprogress $cat-turn) (status uncontrollable)))
          (when (enabled $mouse-turn) (and (inprogress $mouse-turn) (status uncontrollable)))
          (when (enabled $cat-0-move-0) (and (inprogress $cat-0-move-0) (status uncontrollable)))
          (when (enabled $cat-0-move-1) (and (inprogress $cat-0-move-1) (status uncontrollable)))
          (when (enabled $cat-0-move-2) (and (inprogress $cat-0-move-2) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $safe))
        (not (inprogress $cat-turn))
        (not (inprogress $mouse-turn))
        (not (inprogress $cat-0-move-0))
        (not (inprogress $cat-0-move-1))
        (not (inprogress $cat-0-move-2))
      )
    :effect
      (and
        (inprogress $safe)
        (inprogress $cat-turn)
        (inprogress $mouse-turn)
        (inprogress $cat-0-move-0)
        (inprogress $cat-0-move-1)
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
        (when (at $-1 $Mouse-0) (marked $-1 $Mouse-0))
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
        (when (at $-1 $Cat-0) (marked $-1 $Cat-0))
        (when (at $0 $Cat-0) (marked $0 $Cat-0))
        (when (at $1 $Cat-0) (marked $1 $Cat-0))
        (when (at $2 $Cat-0) (marked $2 $Cat-0))
        (when (at $3 $Cat-0) (marked $3 $Cat-0))
        (when (at $4 $Cat-0) (marked $4 $Cat-0))
        (when (at $5 $Cat-0) (marked $5 $Cat-0))
        (when (at $6 $Cat-0) (marked $6 $Cat-0))
        (when (at $7 $Cat-0) (marked $7 $Cat-0))
        (when (at $8 $Cat-0) (marked $8 $Cat-0))
      )
  )
  
  (:action do$safe
    :precondition
      (and
        (status busy)
        (enabled $safe)
        (inprogress $safe)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $2 $Mouse-0)
          (and (not (at $2 $Mouse-0)) (at $3 $Mouse-0))
        )
      )
  )
  
  (:action do$cat-turn
    :precondition
      (and
        (status busy)
        (enabled $cat-turn)
        (inprogress $cat-turn)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $3 $Mouse-0)
          (and (not (at $3 $Mouse-0)) (at $4 $Mouse-0))
        )
        (when (at $6 $Mouse-0)
          (and (not (at $6 $Mouse-0)) (at $7 $Mouse-0))
        )
        (when (at $9 $Mouse-0)
          (and (not (at $9 $Mouse-0)) (at $0 $Mouse-0))
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
      )
  )
  
  (:action do$mouse-turn
    :precondition
      (and
        (status busy)
        (enabled $mouse-turn)
        (inprogress $mouse-turn)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Mouse-0)
          (and (not (at $0 $Mouse-0)) (at $1 $Mouse-0))
        )
        (when (at $4 $Mouse-0)
          (and (not (at $4 $Mouse-0)) (at $5 $Mouse-0))
        )
        (when (at $7 $Mouse-0)
          (and (not (at $7 $Mouse-0)) (at $8 $Mouse-0))
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
      )
  )
  
  (:action do$mouse-0-move-2
    :precondition
      (and
        (status busy)
        (enabled $mouse-0-move-2)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Mouse-0)
          (and (not (at $1 $Mouse-0)) (at $9 $Mouse-0))
        )
        (when (at $5 $Mouse-0)
          (and (not (at $5 $Mouse-0)) (at $9 $Mouse-0))
        )
        (when (at $7 $Cat-0)
          (and (not (at $7 $Cat-0)) (at $-1 $Cat-0))
        )
      )
  )
  
  (:action do$mouse-0-move-1
    :precondition
      (and
        (status busy)
        (enabled $mouse-0-move-1)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Mouse-0)
          (and (not (at $1 $Mouse-0)) (at $2 $Mouse-0))
        )
        (when (at $5 $Mouse-0)
          (and (not (at $5 $Mouse-0)) (at $2 $Mouse-0))
        )
        (when (at $8 $Mouse-0)
          (and (not (at $8 $Mouse-0)) (at $2 $Mouse-0))
        )
      )
  )
  
  (:action do$mouse-0-move-0
    :precondition
      (and
        (status busy)
        (enabled $mouse-0-move-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Mouse-0)
          (and (not (at $5 $Mouse-0)) (at $6 $Mouse-0))
        )
        (when (at $8 $Mouse-0)
          (and (not (at $8 $Mouse-0)) (at $6 $Mouse-0))
        )
        (when (at $1 $Cat-0)
          (and (not (at $1 $Cat-0)) (at $-1 $Cat-0))
        )
      )
  )
  
  (:action do$cat-0-move-0
    :precondition
      (and
        (status busy)
        (enabled $cat-0-move-0)
        (inprogress $cat-0-move-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $7 $Mouse-0)
          (and (not (at $7 $Mouse-0)) (at $-1 $Mouse-0))
        )
        (when (at $2 $Cat-0)
          (and (not (at $2 $Cat-0)) (at $0 $Cat-0))
        )
        (when (at $5 $Cat-0)
          (and (not (at $5 $Cat-0)) (at $0 $Cat-0))
        )
      )
  )
  
  (:action do$cat-0-move-1
    :precondition
      (and
        (status busy)
        (enabled $cat-0-move-1)
        (inprogress $cat-0-move-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Cat-0)
          (and (not (at $2 $Cat-0)) (at $3 $Cat-0))
        )
        (when (at $5 $Cat-0)
          (and (not (at $5 $Cat-0)) (at $3 $Cat-0))
        )
        (when (at $8 $Cat-0)
          (and (not (at $8 $Cat-0)) (at $3 $Cat-0))
        )
      )
  )
  
  (:action do$cat-0-move-2
    :precondition
      (and
        (status busy)
        (enabled $cat-0-move-2)
        (inprogress $cat-0-move-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Mouse-0)
          (and (not (at $0 $Mouse-0)) (at $-1 $Mouse-0))
        )
        (when (at $5 $Cat-0)
          (and (not (at $5 $Cat-0)) (at $6 $Cat-0))
        )
        (when (at $8 $Cat-0)
          (and (not (at $8 $Cat-0)) (at $6 $Cat-0))
        )
      )
  )
)

