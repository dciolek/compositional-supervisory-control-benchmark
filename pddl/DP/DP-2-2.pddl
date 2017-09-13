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
    $Philosopher-0 $Philosopher-1 $Fork-1 $Fork-0 - LTS
    $-1 $0 $1 $2 $3 $4 $5 $6 $7 $8 - State
    $eat-0 $eat-1 $think-0 $think-1 $take-1-0 $take-1-1 $release-0-1 $release-0-0 $step-0 $step-1 $take-0-0 $take-0-1 $release-1-1 $end $release-1-0 - Label
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
        (not (enabled $eat-0))
        (not (enabled $eat-1))
        (not (enabled $think-0))
        (not (enabled $think-1))
        (not (enabled $take-1-0))
        (not (enabled $take-1-1))
        (not (enabled $release-0-1))
        (not (enabled $release-0-0))
        (not (enabled $step-0))
        (not (enabled $step-1))
        (not (enabled $take-0-0))
        (not (enabled $take-0-1))
        (not (enabled $release-1-1))
        (not (enabled $end))
        (not (enabled $release-1-0))
        (not (inprogress $eat-0))
        (not (inprogress $eat-1))
        (not (inprogress $think-0))
        (not (inprogress $think-1))
        (not (inprogress $step-0))
        (not (inprogress $step-1))
        (not (inprogress $release-0-1))
        (not (inprogress $release-0-0))
        (not (inprogress $end))
        (not (inprogress $release-1-1))
        (not (inprogress $release-1-0))
        (not (ready $eat-0 $Philosopher-0))
        (not (ready $think-0 $Philosopher-0))
        (not (ready $step-0 $Philosopher-0))
        (not (ready $take-0-0 $Philosopher-0))
        (not (ready $release-0-1 $Philosopher-0))
        (not (ready $release-0-0 $Philosopher-0))
        (not (ready $take-0-1 $Philosopher-0))
        (not (ready $end $Philosopher-0))
        (not (ready $eat-1 $Philosopher-1))
        (not (ready $think-1 $Philosopher-1))
        (not (ready $step-1 $Philosopher-1))
        (not (ready $take-1-0 $Philosopher-1))
        (not (ready $take-1-1 $Philosopher-1))
        (not (ready $release-1-1 $Philosopher-1))
        (not (ready $end $Philosopher-1))
        (not (ready $release-1-0 $Philosopher-1))
        (not (ready $take-1-1 $Fork-1))
        (not (ready $release-0-1 $Fork-1))
        (not (ready $take-0-1 $Fork-1))
        (not (ready $release-1-1 $Fork-1))
        (not (ready $take-1-0 $Fork-0))
        (not (ready $take-0-0 $Fork-0))
        (not (ready $release-0-0 $Fork-0))
        (not (ready $release-1-0 $Fork-0))
        (not (hoop $Philosopher-0))
        (not (hoop $Philosopher-1))
        (not (hoop $Fork-1))
        (not (hoop $Fork-0))
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
        (when (at $0 $Philosopher-0)
          (ready $think-0 $Philosopher-0)
        )
        (when (at $1 $Philosopher-0)
          (ready $take-0-0 $Philosopher-0)
        )
        (when (at $2 $Philosopher-0)
          (ready $step-0 $Philosopher-0)
        )
        (when (at $3 $Philosopher-0)
          (ready $step-0 $Philosopher-0)
        )
        (when (at $4 $Philosopher-0)
          (ready $take-0-1 $Philosopher-0)
        )
        (when (at $5 $Philosopher-0)
          (ready $eat-0 $Philosopher-0)
        )
        (when (at $6 $Philosopher-0)
          (ready $release-0-0 $Philosopher-0)
        )
        (when (at $7 $Philosopher-0)
          (ready $release-0-1 $Philosopher-0)
        )
        (when (at $8 $Philosopher-0)
          (ready $end $Philosopher-0)
        )
        (when (at $0 $Philosopher-1)
          (ready $think-1 $Philosopher-1)
        )
        (when (at $1 $Philosopher-1)
          (ready $take-1-1 $Philosopher-1)
        )
        (when (at $2 $Philosopher-1)
          (ready $step-1 $Philosopher-1)
        )
        (when (at $3 $Philosopher-1)
          (ready $step-1 $Philosopher-1)
        )
        (when (at $4 $Philosopher-1)
          (ready $take-1-0 $Philosopher-1)
        )
        (when (at $5 $Philosopher-1)
          (ready $eat-1 $Philosopher-1)
        )
        (when (at $6 $Philosopher-1)
          (ready $release-1-1 $Philosopher-1)
        )
        (when (at $7 $Philosopher-1)
          (ready $release-1-0 $Philosopher-1)
        )
        (when (at $8 $Philosopher-1)
          (ready $end $Philosopher-1)
        )
        (when (at $0 $Fork-1)
          (and
            (ready $release-0-1 $Fork-1)
            (ready $take-1-1 $Fork-1)
            (ready $release-1-1 $Fork-1)
            (ready $take-0-1 $Fork-1)
          )
        )
        (when (at $1 $Fork-1)
          (and
            (ready $release-0-1 $Fork-1)
            (ready $take-1-1 $Fork-1)
            (ready $release-1-1 $Fork-1)
            (ready $take-0-1 $Fork-1)
          )
        )
        (when (at $0 $Fork-0)
          (and
            (ready $release-0-0 $Fork-0)
            (ready $release-1-0 $Fork-0)
            (ready $take-1-0 $Fork-0)
            (ready $take-0-0 $Fork-0)
          )
        )
        (when (at $1 $Fork-0)
          (and
            (ready $release-0-0 $Fork-0)
            (ready $release-1-0 $Fork-0)
            (ready $take-1-0 $Fork-0)
            (ready $take-0-0 $Fork-0)
          )
        )
        (when (and (at $0 $Philosopher-0) (marked $0 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $1 $Philosopher-0) (marked $1 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $2 $Philosopher-0) (marked $2 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $3 $Philosopher-0) (marked $3 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $4 $Philosopher-0) (marked $4 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $5 $Philosopher-0) (marked $5 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $6 $Philosopher-0) (marked $6 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $7 $Philosopher-0) (marked $7 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $8 $Philosopher-0) (marked $8 $Philosopher-0))
          (hoop $Philosopher-0)
        )
        (when (and (at $0 $Philosopher-1) (marked $0 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $1 $Philosopher-1) (marked $1 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $2 $Philosopher-1) (marked $2 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $3 $Philosopher-1) (marked $3 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $4 $Philosopher-1) (marked $4 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $5 $Philosopher-1) (marked $5 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $6 $Philosopher-1) (marked $6 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $7 $Philosopher-1) (marked $7 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $8 $Philosopher-1) (marked $8 $Philosopher-1))
          (hoop $Philosopher-1)
        )
        (when (and (at $-1 $Fork-1) (marked $-1 $Fork-1))
          (hoop $Fork-1)
        )
        (when (and (at $0 $Fork-1) (marked $0 $Fork-1))
          (hoop $Fork-1)
        )
        (when (and (at $1 $Fork-1) (marked $1 $Fork-1))
          (hoop $Fork-1)
        )
        (when (and (at $-1 $Fork-0) (marked $-1 $Fork-0))
          (hoop $Fork-0)
        )
        (when (and (at $0 $Fork-0) (marked $0 $Fork-0))
          (hoop $Fork-0)
        )
        (when (and (at $1 $Fork-0) (marked $1 $Fork-0))
          (hoop $Fork-0)
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
            (ready $eat-0 $Philosopher-0)
          )
          (and
            (enabled $eat-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $eat-1 $Philosopher-1)
          )
          (and
            (enabled $eat-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $think-0 $Philosopher-0)
          )
          (and
            (enabled $think-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $think-1 $Philosopher-1)
          )
          (and
            (enabled $think-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $take-1-0 $Philosopher-1)
            (ready $take-1-0 $Fork-0)
          )
          (enabled $take-1-0)
        )
        (when
          (and
            (ready $take-1-1 $Philosopher-1)
            (ready $take-1-1 $Fork-1)
          )
          (enabled $take-1-1)
        )
        (when
          (and
            (ready $release-0-1 $Philosopher-0)
            (ready $release-0-1 $Fork-1)
          )
          (and
            (enabled $release-0-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $release-0-0 $Philosopher-0)
            (ready $release-0-0 $Fork-0)
          )
          (and
            (enabled $release-0-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $step-0 $Philosopher-0)
          )
          (and
            (enabled $step-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $step-1 $Philosopher-1)
          )
          (and
            (enabled $step-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $take-0-0 $Philosopher-0)
            (ready $take-0-0 $Fork-0)
          )
          (enabled $take-0-0)
        )
        (when
          (and
            (ready $take-0-1 $Philosopher-0)
            (ready $take-0-1 $Fork-1)
          )
          (enabled $take-0-1)
        )
        (when
          (and
            (ready $release-1-1 $Philosopher-1)
            (ready $release-1-1 $Fork-1)
          )
          (and
            (enabled $release-1-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $end $Philosopher-0)
            (ready $end $Philosopher-1)
          )
          (and
            (enabled $end)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $release-1-0 $Philosopher-1)
            (ready $release-1-0 $Fork-0)
          )
          (and
            (enabled $release-1-0)
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
          (when (enabled $eat-0) (inprogress $eat-0))
          (when (enabled $eat-1) (inprogress $eat-1))
          (when (enabled $think-0) (inprogress $think-0))
          (when (enabled $think-1) (inprogress $think-1))
          (when (enabled $step-0) (inprogress $step-0))
          (when (enabled $step-1) (inprogress $step-1))
          (when (enabled $release-0-1) (inprogress $release-0-1))
          (when (enabled $release-0-0) (inprogress $release-0-0))
          (when (enabled $end) (inprogress $end))
          (when (enabled $release-1-1) (inprogress $release-1-1))
          (when (enabled $release-1-0) (inprogress $release-1-0))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $eat-0))
        (not (inprogress $eat-1))
        (not (inprogress $think-0))
        (not (inprogress $think-1))
        (not (inprogress $step-0))
        (not (inprogress $step-1))
        (not (inprogress $release-0-1))
        (not (inprogress $release-0-0))
        (not (inprogress $end))
        (not (inprogress $release-1-1))
        (not (inprogress $release-1-0))
      )
    :effect
      (and
        (inprogress $eat-0)
        (inprogress $eat-1)
        (inprogress $think-0)
        (inprogress $think-1)
        (inprogress $step-0)
        (inprogress $step-1)
        (inprogress $release-0-1)
        (inprogress $release-0-0)
        (inprogress $end)
        (inprogress $release-1-1)
        (inprogress $release-1-0)
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
        (when (at $0 $Philosopher-0) (marked $0 $Philosopher-0))
        (when (at $1 $Philosopher-0) (marked $1 $Philosopher-0))
        (when (at $2 $Philosopher-0) (marked $2 $Philosopher-0))
        (when (at $3 $Philosopher-0) (marked $3 $Philosopher-0))
        (when (at $4 $Philosopher-0) (marked $4 $Philosopher-0))
        (when (at $5 $Philosopher-0) (marked $5 $Philosopher-0))
        (when (at $6 $Philosopher-0) (marked $6 $Philosopher-0))
        (when (at $7 $Philosopher-0) (marked $7 $Philosopher-0))
        (when (at $8 $Philosopher-0) (marked $8 $Philosopher-0))
        (when (at $0 $Philosopher-1) (marked $0 $Philosopher-1))
        (when (at $1 $Philosopher-1) (marked $1 $Philosopher-1))
        (when (at $2 $Philosopher-1) (marked $2 $Philosopher-1))
        (when (at $3 $Philosopher-1) (marked $3 $Philosopher-1))
        (when (at $4 $Philosopher-1) (marked $4 $Philosopher-1))
        (when (at $5 $Philosopher-1) (marked $5 $Philosopher-1))
        (when (at $6 $Philosopher-1) (marked $6 $Philosopher-1))
        (when (at $7 $Philosopher-1) (marked $7 $Philosopher-1))
        (when (at $8 $Philosopher-1) (marked $8 $Philosopher-1))
        (when (at $-1 $Fork-1) (marked $-1 $Fork-1))
        (when (at $0 $Fork-1) (marked $0 $Fork-1))
        (when (at $1 $Fork-1) (marked $1 $Fork-1))
        (when (at $-1 $Fork-0) (marked $-1 $Fork-0))
        (when (at $0 $Fork-0) (marked $0 $Fork-0))
        (when (at $1 $Fork-0) (marked $1 $Fork-0))
      )
  )
  
  (:action do$eat-0
    :precondition
      (and
        (status busy)
        (inprogress $eat-0)
        (enabled $eat-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Philosopher-0)
          (and (not (at $5 $Philosopher-0)) (at $6 $Philosopher-0))
        )
      )
  )
  
  (:action do$eat-1
    :precondition
      (and
        (status busy)
        (inprogress $eat-1)
        (enabled $eat-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Philosopher-1)
          (and (not (at $5 $Philosopher-1)) (at $6 $Philosopher-1))
        )
      )
  )
  
  (:action do$think-0
    :precondition
      (and
        (status busy)
        (inprogress $think-0)
        (enabled $think-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Philosopher-0)
          (and (not (at $0 $Philosopher-0)) (at $1 $Philosopher-0))
        )
      )
  )
  
  (:action do$think-1
    :precondition
      (and
        (status busy)
        (inprogress $think-1)
        (enabled $think-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Philosopher-1)
          (and (not (at $0 $Philosopher-1)) (at $1 $Philosopher-1))
        )
      )
  )
  
  (:action do$take-1-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $take-1-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $4 $Philosopher-1)
          (and (not (at $4 $Philosopher-1)) (at $5 $Philosopher-1))
        )
        (when (at $0 $Fork-0)
          (and (not (at $0 $Fork-0)) (at $1 $Fork-0))
        )
        (when (at $1 $Fork-0)
          (and (not (at $1 $Fork-0)) (at $-1 $Fork-0))
        )
      )
  )
  
  (:action do$take-1-1
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $take-1-1)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $1 $Philosopher-1)
          (and (not (at $1 $Philosopher-1)) (at $2 $Philosopher-1))
        )
        (when (at $0 $Fork-1)
          (and (not (at $0 $Fork-1)) (at $1 $Fork-1))
        )
        (when (at $1 $Fork-1)
          (and (not (at $1 $Fork-1)) (at $-1 $Fork-1))
        )
      )
  )
  
  (:action do$release-0-1
    :precondition
      (and
        (status busy)
        (inprogress $release-0-1)
        (enabled $release-0-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $7 $Philosopher-0)
          (and (not (at $7 $Philosopher-0)) (at $8 $Philosopher-0))
        )
        (when (at $1 $Fork-1)
          (and (not (at $1 $Fork-1)) (at $0 $Fork-1))
        )
      )
  )
  
  (:action do$release-0-0
    :precondition
      (and
        (status busy)
        (inprogress $release-0-0)
        (enabled $release-0-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $6 $Philosopher-0)
          (and (not (at $6 $Philosopher-0)) (at $7 $Philosopher-0))
        )
        (when (at $1 $Fork-0)
          (and (not (at $1 $Fork-0)) (at $0 $Fork-0))
        )
      )
  )
  
  (:action do$step-0
    :precondition
      (and
        (status busy)
        (inprogress $step-0)
        (enabled $step-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Philosopher-0)
          (and (not (at $2 $Philosopher-0)) (at $3 $Philosopher-0))
        )
        (when (at $3 $Philosopher-0)
          (and (not (at $3 $Philosopher-0)) (at $4 $Philosopher-0))
        )
      )
  )
  
  (:action do$step-1
    :precondition
      (and
        (status busy)
        (inprogress $step-1)
        (enabled $step-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Philosopher-1)
          (and (not (at $2 $Philosopher-1)) (at $3 $Philosopher-1))
        )
        (when (at $3 $Philosopher-1)
          (and (not (at $3 $Philosopher-1)) (at $4 $Philosopher-1))
        )
      )
  )
  
  (:action do$take-0-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $take-0-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $1 $Philosopher-0)
          (and (not (at $1 $Philosopher-0)) (at $2 $Philosopher-0))
        )
        (when (at $0 $Fork-0)
          (and (not (at $0 $Fork-0)) (at $1 $Fork-0))
        )
        (when (at $1 $Fork-0)
          (and (not (at $1 $Fork-0)) (at $-1 $Fork-0))
        )
      )
  )
  
  (:action do$take-0-1
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $take-0-1)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $4 $Philosopher-0)
          (and (not (at $4 $Philosopher-0)) (at $5 $Philosopher-0))
        )
        (when (at $0 $Fork-1)
          (and (not (at $0 $Fork-1)) (at $1 $Fork-1))
        )
        (when (at $1 $Fork-1)
          (and (not (at $1 $Fork-1)) (at $-1 $Fork-1))
        )
      )
  )
  
  (:action do$release-1-1
    :precondition
      (and
        (status busy)
        (inprogress $release-1-1)
        (enabled $release-1-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $6 $Philosopher-1)
          (and (not (at $6 $Philosopher-1)) (at $7 $Philosopher-1))
        )
        (when (at $1 $Fork-1)
          (and (not (at $1 $Fork-1)) (at $0 $Fork-1))
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
        (when (at $8 $Philosopher-0)
          (and (not (at $8 $Philosopher-0)) (at $0 $Philosopher-0))
        )
        (when (at $8 $Philosopher-1)
          (and (not (at $8 $Philosopher-1)) (at $0 $Philosopher-1))
        )
      )
  )
  
  (:action do$release-1-0
    :precondition
      (and
        (status busy)
        (inprogress $release-1-0)
        (enabled $release-1-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $7 $Philosopher-1)
          (and (not (at $7 $Philosopher-1)) (at $8 $Philosopher-1))
        )
        (when (at $1 $Fork-0)
          (and (not (at $1 $Fork-0)) (at $0 $Fork-0))
        )
      )
  )
)
