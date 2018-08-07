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
    $Philosopher-0 $Monitor-1 $Monitor-2 $Monitor-0 $Philosopher-1 $Philosopher-2 $Fork-3 $Fork-2 $Fork-0 $Fork-1 $Philosopher-3 $Monitor-3 - LTS
    $0 $1 $2 $3 $4 $5 $6 $7 - State
    $eat-0 $take-2-3 $eat-1 $take-3-3 $eat-2 $eat-3 $step-3 $release-0-1 $step-2 $release-0-0 $step-0 $step-1 $take-3-0 $take-0-0 $take-0-1 $take-2-2 $think-2 $think-3 $think-0 $think-1 $take-1-2 $take-1-1 $release-3-3 $eat-all $release-2-3 $release-2-2 $release-3-0 $release-1-2 $release-1-1 - Label
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
        (not (enabled $eat-0))
        (not (enabled $take-2-3))
        (not (enabled $eat-1))
        (not (enabled $take-3-3))
        (not (enabled $eat-2))
        (not (enabled $eat-3))
        (not (enabled $step-3))
        (not (enabled $release-0-1))
        (not (enabled $step-2))
        (not (enabled $release-0-0))
        (not (enabled $step-0))
        (not (enabled $step-1))
        (not (enabled $take-3-0))
        (not (enabled $take-0-0))
        (not (enabled $take-0-1))
        (not (enabled $take-2-2))
        (not (enabled $think-2))
        (not (enabled $think-3))
        (not (enabled $think-0))
        (not (enabled $think-1))
        (not (enabled $take-1-2))
        (not (enabled $take-1-1))
        (not (enabled $release-3-3))
        (not (enabled $eat-all))
        (not (enabled $release-2-3))
        (not (enabled $release-2-2))
        (not (enabled $release-3-0))
        (not (enabled $release-1-2))
        (not (enabled $release-1-1))
        (not (inprogress $eat-0))
        (not (inprogress $think-2))
        (not (inprogress $eat-1))
        (not (inprogress $think-3))
        (not (inprogress $think-0))
        (not (inprogress $think-1))
        (not (inprogress $eat-2))
        (not (inprogress $eat-3))
        (not (inprogress $eat-all))
        (not (inprogress $release-3-3))
        (not (inprogress $step-3))
        (not (inprogress $release-0-1))
        (not (inprogress $step-2))
        (not (inprogress $release-0-0))
        (not (inprogress $release-2-3))
        (not (inprogress $release-2-2))
        (not (inprogress $step-0))
        (not (inprogress $step-1))
        (not (inprogress $release-3-0))
        (not (inprogress $release-1-2))
        (not (inprogress $release-1-1))
        (not (ready $eat-0 $Philosopher-0))
        (not (ready $think-0 $Philosopher-0))
        (not (ready $step-0 $Philosopher-0))
        (not (ready $take-0-0 $Philosopher-0))
        (not (ready $release-0-1 $Philosopher-0))
        (not (ready $release-0-0 $Philosopher-0))
        (not (ready $take-0-1 $Philosopher-0))
        (not (ready $eat-1 $Monitor-1))
        (not (ready $eat-all $Monitor-1))
        (not (ready $eat-2 $Monitor-2))
        (not (ready $eat-all $Monitor-2))
        (not (ready $eat-0 $Monitor-0))
        (not (ready $eat-all $Monitor-0))
        (not (ready $eat-1 $Philosopher-1))
        (not (ready $think-1 $Philosopher-1))
        (not (ready $take-1-2 $Philosopher-1))
        (not (ready $step-1 $Philosopher-1))
        (not (ready $take-1-1 $Philosopher-1))
        (not (ready $release-1-2 $Philosopher-1))
        (not (ready $release-1-1 $Philosopher-1))
        (not (ready $think-2 $Philosopher-2))
        (not (ready $take-2-3 $Philosopher-2))
        (not (ready $release-2-2 $Philosopher-2))
        (not (ready $eat-2 $Philosopher-2))
        (not (ready $step-2 $Philosopher-2))
        (not (ready $take-2-2 $Philosopher-2))
        (not (ready $release-2-3 $Philosopher-2))
        (not (ready $take-2-3 $Fork-3))
        (not (ready $take-3-3 $Fork-3))
        (not (ready $release-3-3 $Fork-3))
        (not (ready $release-2-3 $Fork-3))
        (not (ready $release-2-2 $Fork-2))
        (not (ready $take-1-2 $Fork-2))
        (not (ready $release-1-2 $Fork-2))
        (not (ready $take-2-2 $Fork-2))
        (not (ready $release-3-0 $Fork-0))
        (not (ready $take-3-0 $Fork-0))
        (not (ready $take-0-0 $Fork-0))
        (not (ready $release-0-0 $Fork-0))
        (not (ready $take-1-1 $Fork-1))
        (not (ready $release-0-1 $Fork-1))
        (not (ready $take-0-1 $Fork-1))
        (not (ready $release-1-1 $Fork-1))
        (not (ready $think-3 $Philosopher-3))
        (not (ready $take-3-3 $Philosopher-3))
        (not (ready $release-3-0 $Philosopher-3))
        (not (ready $eat-3 $Philosopher-3))
        (not (ready $release-3-3 $Philosopher-3))
        (not (ready $step-3 $Philosopher-3))
        (not (ready $take-3-0 $Philosopher-3))
        (not (ready $eat-3 $Monitor-3))
        (not (ready $eat-all $Monitor-3))
        (not (hoop $Philosopher-0))
        (not (hoop $Monitor-1))
        (not (hoop $Monitor-2))
        (not (hoop $Monitor-0))
        (not (hoop $Philosopher-1))
        (not (hoop $Philosopher-2))
        (not (hoop $Fork-3))
        (not (hoop $Fork-2))
        (not (hoop $Fork-0))
        (not (hoop $Fork-1))
        (not (hoop $Philosopher-3))
        (not (hoop $Monitor-3))
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
        (when (at $0 $Monitor-1)
          (ready $eat-1 $Monitor-1)
        )
        (when (at $1 $Monitor-1)
          (and
            (ready $eat-1 $Monitor-1)
            (ready $eat-all $Monitor-1)
          )
        )
        (when (at $0 $Monitor-2)
          (ready $eat-2 $Monitor-2)
        )
        (when (at $1 $Monitor-2)
          (and
            (ready $eat-2 $Monitor-2)
            (ready $eat-all $Monitor-2)
          )
        )
        (when (at $0 $Monitor-0)
          (ready $eat-0 $Monitor-0)
        )
        (when (at $1 $Monitor-0)
          (and
            (ready $eat-0 $Monitor-0)
            (ready $eat-all $Monitor-0)
          )
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
          (ready $take-1-2 $Philosopher-1)
        )
        (when (at $5 $Philosopher-1)
          (ready $eat-1 $Philosopher-1)
        )
        (when (at $6 $Philosopher-1)
          (ready $release-1-1 $Philosopher-1)
        )
        (when (at $7 $Philosopher-1)
          (ready $release-1-2 $Philosopher-1)
        )
        (when (at $0 $Philosopher-2)
          (ready $think-2 $Philosopher-2)
        )
        (when (at $1 $Philosopher-2)
          (ready $take-2-2 $Philosopher-2)
        )
        (when (at $2 $Philosopher-2)
          (ready $step-2 $Philosopher-2)
        )
        (when (at $3 $Philosopher-2)
          (ready $step-2 $Philosopher-2)
        )
        (when (at $4 $Philosopher-2)
          (ready $take-2-3 $Philosopher-2)
        )
        (when (at $5 $Philosopher-2)
          (ready $eat-2 $Philosopher-2)
        )
        (when (at $6 $Philosopher-2)
          (ready $release-2-2 $Philosopher-2)
        )
        (when (at $7 $Philosopher-2)
          (ready $release-2-3 $Philosopher-2)
        )
        (when (at $0 $Fork-3)
          (and
            (ready $take-3-3 $Fork-3)
            (ready $take-2-3 $Fork-3)
          )
        )
        (when (at $1 $Fork-3)
          (and
            (ready $release-3-3 $Fork-3)
            (ready $release-2-3 $Fork-3)
          )
        )
        (when (at $0 $Fork-2)
          (and
            (ready $take-2-2 $Fork-2)
            (ready $take-1-2 $Fork-2)
          )
        )
        (when (at $1 $Fork-2)
          (and
            (ready $release-1-2 $Fork-2)
            (ready $release-2-2 $Fork-2)
          )
        )
        (when (at $0 $Fork-0)
          (and
            (ready $take-3-0 $Fork-0)
            (ready $take-0-0 $Fork-0)
          )
        )
        (when (at $1 $Fork-0)
          (and
            (ready $release-3-0 $Fork-0)
            (ready $release-0-0 $Fork-0)
          )
        )
        (when (at $0 $Fork-1)
          (and
            (ready $take-1-1 $Fork-1)
            (ready $take-0-1 $Fork-1)
          )
        )
        (when (at $1 $Fork-1)
          (and
            (ready $release-0-1 $Fork-1)
            (ready $release-1-1 $Fork-1)
          )
        )
        (when (at $0 $Philosopher-3)
          (ready $think-3 $Philosopher-3)
        )
        (when (at $1 $Philosopher-3)
          (ready $take-3-3 $Philosopher-3)
        )
        (when (at $2 $Philosopher-3)
          (ready $step-3 $Philosopher-3)
        )
        (when (at $3 $Philosopher-3)
          (ready $step-3 $Philosopher-3)
        )
        (when (at $4 $Philosopher-3)
          (ready $take-3-0 $Philosopher-3)
        )
        (when (at $5 $Philosopher-3)
          (ready $eat-3 $Philosopher-3)
        )
        (when (at $6 $Philosopher-3)
          (ready $release-3-3 $Philosopher-3)
        )
        (when (at $7 $Philosopher-3)
          (ready $release-3-0 $Philosopher-3)
        )
        (when (at $0 $Monitor-3)
          (ready $eat-3 $Monitor-3)
        )
        (when (at $1 $Monitor-3)
          (and
            (ready $eat-3 $Monitor-3)
            (ready $eat-all $Monitor-3)
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
        (when (and (at $0 $Monitor-1) (marked $0 $Monitor-1))
          (hoop $Monitor-1)
        )
        (when (and (at $1 $Monitor-1) (marked $1 $Monitor-1))
          (hoop $Monitor-1)
        )
        (when (and (at $0 $Monitor-2) (marked $0 $Monitor-2))
          (hoop $Monitor-2)
        )
        (when (and (at $1 $Monitor-2) (marked $1 $Monitor-2))
          (hoop $Monitor-2)
        )
        (when (and (at $0 $Monitor-0) (marked $0 $Monitor-0))
          (hoop $Monitor-0)
        )
        (when (and (at $1 $Monitor-0) (marked $1 $Monitor-0))
          (hoop $Monitor-0)
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
        (when (and (at $0 $Philosopher-2) (marked $0 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $1 $Philosopher-2) (marked $1 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $2 $Philosopher-2) (marked $2 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $3 $Philosopher-2) (marked $3 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $4 $Philosopher-2) (marked $4 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $5 $Philosopher-2) (marked $5 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $6 $Philosopher-2) (marked $6 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $7 $Philosopher-2) (marked $7 $Philosopher-2))
          (hoop $Philosopher-2)
        )
        (when (and (at $0 $Fork-3) (marked $0 $Fork-3))
          (hoop $Fork-3)
        )
        (when (and (at $1 $Fork-3) (marked $1 $Fork-3))
          (hoop $Fork-3)
        )
        (when (and (at $0 $Fork-2) (marked $0 $Fork-2))
          (hoop $Fork-2)
        )
        (when (and (at $1 $Fork-2) (marked $1 $Fork-2))
          (hoop $Fork-2)
        )
        (when (and (at $0 $Fork-0) (marked $0 $Fork-0))
          (hoop $Fork-0)
        )
        (when (and (at $1 $Fork-0) (marked $1 $Fork-0))
          (hoop $Fork-0)
        )
        (when (and (at $0 $Fork-1) (marked $0 $Fork-1))
          (hoop $Fork-1)
        )
        (when (and (at $1 $Fork-1) (marked $1 $Fork-1))
          (hoop $Fork-1)
        )
        (when (and (at $0 $Philosopher-3) (marked $0 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $1 $Philosopher-3) (marked $1 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $2 $Philosopher-3) (marked $2 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $3 $Philosopher-3) (marked $3 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $4 $Philosopher-3) (marked $4 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $5 $Philosopher-3) (marked $5 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $6 $Philosopher-3) (marked $6 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $7 $Philosopher-3) (marked $7 $Philosopher-3))
          (hoop $Philosopher-3)
        )
        (when (and (at $0 $Monitor-3) (marked $0 $Monitor-3))
          (hoop $Monitor-3)
        )
        (when (and (at $1 $Monitor-3) (marked $1 $Monitor-3))
          (hoop $Monitor-3)
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
            (ready $eat-0 $Monitor-0)
          )
          (enabled $eat-0)
        )
        (when
          (and
            (ready $take-2-3 $Philosopher-2)
            (ready $take-2-3 $Fork-3)
          )
          (enabled $take-2-3)
        )
        (when
          (and
            (ready $eat-1 $Monitor-1)
            (ready $eat-1 $Philosopher-1)
          )
          (enabled $eat-1)
        )
        (when
          (and
            (ready $take-3-3 $Fork-3)
            (ready $take-3-3 $Philosopher-3)
          )
          (enabled $take-3-3)
        )
        (when
          (and
            (ready $eat-2 $Monitor-2)
            (ready $eat-2 $Philosopher-2)
          )
          (enabled $eat-2)
        )
        (when
          (and
            (ready $eat-3 $Philosopher-3)
            (ready $eat-3 $Monitor-3)
          )
          (enabled $eat-3)
        )
        (when
          (and
            (ready $step-3 $Philosopher-3)
          )
          (enabled $step-3)
        )
        (when
          (and
            (ready $release-0-1 $Philosopher-0)
            (ready $release-0-1 $Fork-1)
          )
          (enabled $release-0-1)
        )
        (when
          (and
            (ready $step-2 $Philosopher-2)
          )
          (enabled $step-2)
        )
        (when
          (and
            (ready $release-0-0 $Philosopher-0)
            (ready $release-0-0 $Fork-0)
          )
          (enabled $release-0-0)
        )
        (when
          (and
            (ready $step-0 $Philosopher-0)
          )
          (enabled $step-0)
        )
        (when
          (and
            (ready $step-1 $Philosopher-1)
          )
          (enabled $step-1)
        )
        (when
          (and
            (ready $take-3-0 $Fork-0)
            (ready $take-3-0 $Philosopher-3)
          )
          (enabled $take-3-0)
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
            (ready $take-2-2 $Philosopher-2)
            (ready $take-2-2 $Fork-2)
          )
          (enabled $take-2-2)
        )
        (when
          (and
            (ready $think-2 $Philosopher-2)
          )
          (enabled $think-2)
        )
        (when
          (and
            (ready $think-3 $Philosopher-3)
          )
          (enabled $think-3)
        )
        (when
          (and
            (ready $think-0 $Philosopher-0)
          )
          (enabled $think-0)
        )
        (when
          (and
            (ready $think-1 $Philosopher-1)
          )
          (enabled $think-1)
        )
        (when
          (and
            (ready $take-1-2 $Philosopher-1)
            (ready $take-1-2 $Fork-2)
          )
          (enabled $take-1-2)
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
            (ready $release-3-3 $Fork-3)
            (ready $release-3-3 $Philosopher-3)
          )
          (enabled $release-3-3)
        )
        (when
          (and
            (ready $eat-all $Monitor-1)
            (ready $eat-all $Monitor-2)
            (ready $eat-all $Monitor-0)
            (ready $eat-all $Monitor-3)
          )
          (enabled $eat-all)
        )
        (when
          (and
            (ready $release-2-3 $Philosopher-2)
            (ready $release-2-3 $Fork-3)
          )
          (enabled $release-2-3)
        )
        (when
          (and
            (ready $release-2-2 $Philosopher-2)
            (ready $release-2-2 $Fork-2)
          )
          (enabled $release-2-2)
        )
        (when
          (and
            (ready $release-3-0 $Fork-0)
            (ready $release-3-0 $Philosopher-3)
          )
          (enabled $release-3-0)
        )
        (when
          (and
            (ready $release-1-2 $Philosopher-1)
            (ready $release-1-2 $Fork-2)
          )
          (enabled $release-1-2)
        )
        (when
          (and
            (ready $release-1-1 $Philosopher-1)
            (ready $release-1-1 $Fork-1)
          )
          (enabled $release-1-1)
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
          (when (enabled $eat-0) (and (inprogress $eat-0) (status uncontrollable)))
          (when (enabled $think-2) (and (inprogress $think-2) (status uncontrollable)))
          (when (enabled $eat-1) (and (inprogress $eat-1) (status uncontrollable)))
          (when (enabled $think-3) (and (inprogress $think-3) (status uncontrollable)))
          (when (enabled $think-0) (and (inprogress $think-0) (status uncontrollable)))
          (when (enabled $think-1) (and (inprogress $think-1) (status uncontrollable)))
          (when (enabled $eat-2) (and (inprogress $eat-2) (status uncontrollable)))
          (when (enabled $eat-3) (and (inprogress $eat-3) (status uncontrollable)))
          (when (enabled $eat-all) (and (inprogress $eat-all) (status uncontrollable)))
          (when (enabled $release-3-3) (and (inprogress $release-3-3) (status uncontrollable)))
          (when (enabled $step-3) (and (inprogress $step-3) (status uncontrollable)))
          (when (enabled $release-0-1) (and (inprogress $release-0-1) (status uncontrollable)))
          (when (enabled $step-2) (and (inprogress $step-2) (status uncontrollable)))
          (when (enabled $release-0-0) (and (inprogress $release-0-0) (status uncontrollable)))
          (when (enabled $release-2-3) (and (inprogress $release-2-3) (status uncontrollable)))
          (when (enabled $release-2-2) (and (inprogress $release-2-2) (status uncontrollable)))
          (when (enabled $step-0) (and (inprogress $step-0) (status uncontrollable)))
          (when (enabled $step-1) (and (inprogress $step-1) (status uncontrollable)))
          (when (enabled $release-3-0) (and (inprogress $release-3-0) (status uncontrollable)))
          (when (enabled $release-1-2) (and (inprogress $release-1-2) (status uncontrollable)))
          (when (enabled $release-1-1) (and (inprogress $release-1-1) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $eat-0))
        (not (inprogress $think-2))
        (not (inprogress $eat-1))
        (not (inprogress $think-3))
        (not (inprogress $think-0))
        (not (inprogress $think-1))
        (not (inprogress $eat-2))
        (not (inprogress $eat-3))
        (not (inprogress $eat-all))
        (not (inprogress $release-3-3))
        (not (inprogress $step-3))
        (not (inprogress $release-0-1))
        (not (inprogress $step-2))
        (not (inprogress $release-0-0))
        (not (inprogress $release-2-3))
        (not (inprogress $release-2-2))
        (not (inprogress $step-0))
        (not (inprogress $step-1))
        (not (inprogress $release-3-0))
        (not (inprogress $release-1-2))
        (not (inprogress $release-1-1))
      )
    :effect
      (and
        (inprogress $eat-0)
        (inprogress $think-2)
        (inprogress $eat-1)
        (inprogress $think-3)
        (inprogress $think-0)
        (inprogress $think-1)
        (inprogress $eat-2)
        (inprogress $eat-3)
        (inprogress $eat-all)
        (inprogress $release-3-3)
        (inprogress $step-3)
        (inprogress $release-0-1)
        (inprogress $step-2)
        (inprogress $release-0-0)
        (inprogress $release-2-3)
        (inprogress $release-2-2)
        (inprogress $step-0)
        (inprogress $step-1)
        (inprogress $release-3-0)
        (inprogress $release-1-2)
        (inprogress $release-1-1)
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
        (when (at $0 $Monitor-1) (marked $0 $Monitor-1))
        (when (at $1 $Monitor-1) (marked $1 $Monitor-1))
        (when (at $0 $Monitor-2) (marked $0 $Monitor-2))
        (when (at $1 $Monitor-2) (marked $1 $Monitor-2))
        (when (at $0 $Monitor-0) (marked $0 $Monitor-0))
        (when (at $1 $Monitor-0) (marked $1 $Monitor-0))
        (when (at $0 $Philosopher-1) (marked $0 $Philosopher-1))
        (when (at $1 $Philosopher-1) (marked $1 $Philosopher-1))
        (when (at $2 $Philosopher-1) (marked $2 $Philosopher-1))
        (when (at $3 $Philosopher-1) (marked $3 $Philosopher-1))
        (when (at $4 $Philosopher-1) (marked $4 $Philosopher-1))
        (when (at $5 $Philosopher-1) (marked $5 $Philosopher-1))
        (when (at $6 $Philosopher-1) (marked $6 $Philosopher-1))
        (when (at $7 $Philosopher-1) (marked $7 $Philosopher-1))
        (when (at $0 $Philosopher-2) (marked $0 $Philosopher-2))
        (when (at $1 $Philosopher-2) (marked $1 $Philosopher-2))
        (when (at $2 $Philosopher-2) (marked $2 $Philosopher-2))
        (when (at $3 $Philosopher-2) (marked $3 $Philosopher-2))
        (when (at $4 $Philosopher-2) (marked $4 $Philosopher-2))
        (when (at $5 $Philosopher-2) (marked $5 $Philosopher-2))
        (when (at $6 $Philosopher-2) (marked $6 $Philosopher-2))
        (when (at $7 $Philosopher-2) (marked $7 $Philosopher-2))
        (when (at $0 $Fork-3) (marked $0 $Fork-3))
        (when (at $1 $Fork-3) (marked $1 $Fork-3))
        (when (at $0 $Fork-2) (marked $0 $Fork-2))
        (when (at $1 $Fork-2) (marked $1 $Fork-2))
        (when (at $0 $Fork-0) (marked $0 $Fork-0))
        (when (at $1 $Fork-0) (marked $1 $Fork-0))
        (when (at $0 $Fork-1) (marked $0 $Fork-1))
        (when (at $1 $Fork-1) (marked $1 $Fork-1))
        (when (at $0 $Philosopher-3) (marked $0 $Philosopher-3))
        (when (at $1 $Philosopher-3) (marked $1 $Philosopher-3))
        (when (at $2 $Philosopher-3) (marked $2 $Philosopher-3))
        (when (at $3 $Philosopher-3) (marked $3 $Philosopher-3))
        (when (at $4 $Philosopher-3) (marked $4 $Philosopher-3))
        (when (at $5 $Philosopher-3) (marked $5 $Philosopher-3))
        (when (at $6 $Philosopher-3) (marked $6 $Philosopher-3))
        (when (at $7 $Philosopher-3) (marked $7 $Philosopher-3))
        (when (at $0 $Monitor-3) (marked $0 $Monitor-3))
        (when (at $1 $Monitor-3) (marked $1 $Monitor-3))
      )
  )
  
  (:action do$eat-0
    :precondition
      (and
        (status busy)
        (enabled $eat-0)
        (inprogress $eat-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Philosopher-0)
          (and (not (at $5 $Philosopher-0)) (at $6 $Philosopher-0))
        )
        (when (at $0 $Monitor-0)
          (and (not (at $0 $Monitor-0)) (at $1 $Monitor-0))
        )
      )
  )
  
  (:action do$take-2-3
    :precondition
      (and
        (status busy)
        (enabled $take-2-3)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $4 $Philosopher-2)
          (and (not (at $4 $Philosopher-2)) (at $5 $Philosopher-2))
        )
        (when (at $0 $Fork-3)
          (and (not (at $0 $Fork-3)) (at $1 $Fork-3))
        )
      )
  )
  
  (:action do$eat-1
    :precondition
      (and
        (status busy)
        (enabled $eat-1)
        (inprogress $eat-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Monitor-1)
          (and (not (at $0 $Monitor-1)) (at $1 $Monitor-1))
        )
        (when (at $5 $Philosopher-1)
          (and (not (at $5 $Philosopher-1)) (at $6 $Philosopher-1))
        )
      )
  )
  
  (:action do$take-3-3
    :precondition
      (and
        (status busy)
        (enabled $take-3-3)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Fork-3)
          (and (not (at $0 $Fork-3)) (at $1 $Fork-3))
        )
        (when (at $1 $Philosopher-3)
          (and (not (at $1 $Philosopher-3)) (at $2 $Philosopher-3))
        )
      )
  )
  
  (:action do$eat-2
    :precondition
      (and
        (status busy)
        (enabled $eat-2)
        (inprogress $eat-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Monitor-2)
          (and (not (at $0 $Monitor-2)) (at $1 $Monitor-2))
        )
        (when (at $5 $Philosopher-2)
          (and (not (at $5 $Philosopher-2)) (at $6 $Philosopher-2))
        )
      )
  )
  
  (:action do$eat-3
    :precondition
      (and
        (status busy)
        (enabled $eat-3)
        (inprogress $eat-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $5 $Philosopher-3)
          (and (not (at $5 $Philosopher-3)) (at $6 $Philosopher-3))
        )
        (when (at $0 $Monitor-3)
          (and (not (at $0 $Monitor-3)) (at $1 $Monitor-3))
        )
      )
  )
  
  (:action do$step-3
    :precondition
      (and
        (status busy)
        (enabled $step-3)
        (inprogress $step-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Philosopher-3)
          (and (not (at $2 $Philosopher-3)) (at $3 $Philosopher-3))
        )
        (when (at $3 $Philosopher-3)
          (and (not (at $3 $Philosopher-3)) (at $4 $Philosopher-3))
        )
      )
  )
  
  (:action do$release-0-1
    :precondition
      (and
        (status busy)
        (enabled $release-0-1)
        (inprogress $release-0-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $7 $Philosopher-0)
          (and (not (at $7 $Philosopher-0)) (at $0 $Philosopher-0))
        )
        (when (at $1 $Fork-1)
          (and (not (at $1 $Fork-1)) (at $0 $Fork-1))
        )
      )
  )
  
  (:action do$step-2
    :precondition
      (and
        (status busy)
        (enabled $step-2)
        (inprogress $step-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $2 $Philosopher-2)
          (and (not (at $2 $Philosopher-2)) (at $3 $Philosopher-2))
        )
        (when (at $3 $Philosopher-2)
          (and (not (at $3 $Philosopher-2)) (at $4 $Philosopher-2))
        )
      )
  )
  
  (:action do$release-0-0
    :precondition
      (and
        (status busy)
        (enabled $release-0-0)
        (inprogress $release-0-0)
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
        (enabled $step-0)
        (inprogress $step-0)
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
        (enabled $step-1)
        (inprogress $step-1)
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
  
  (:action do$take-3-0
    :precondition
      (and
        (status busy)
        (enabled $take-3-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Fork-0)
          (and (not (at $0 $Fork-0)) (at $1 $Fork-0))
        )
        (when (at $4 $Philosopher-3)
          (and (not (at $4 $Philosopher-3)) (at $5 $Philosopher-3))
        )
      )
  )
  
  (:action do$take-0-0
    :precondition
      (and
        (status busy)
        (enabled $take-0-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Philosopher-0)
          (and (not (at $1 $Philosopher-0)) (at $2 $Philosopher-0))
        )
        (when (at $0 $Fork-0)
          (and (not (at $0 $Fork-0)) (at $1 $Fork-0))
        )
      )
  )
  
  (:action do$take-0-1
    :precondition
      (and
        (status busy)
        (enabled $take-0-1)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $4 $Philosopher-0)
          (and (not (at $4 $Philosopher-0)) (at $5 $Philosopher-0))
        )
        (when (at $0 $Fork-1)
          (and (not (at $0 $Fork-1)) (at $1 $Fork-1))
        )
      )
  )
  
  (:action do$take-2-2
    :precondition
      (and
        (status busy)
        (enabled $take-2-2)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Philosopher-2)
          (and (not (at $1 $Philosopher-2)) (at $2 $Philosopher-2))
        )
        (when (at $0 $Fork-2)
          (and (not (at $0 $Fork-2)) (at $1 $Fork-2))
        )
      )
  )
  
  (:action do$think-2
    :precondition
      (and
        (status busy)
        (enabled $think-2)
        (inprogress $think-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Philosopher-2)
          (and (not (at $0 $Philosopher-2)) (at $1 $Philosopher-2))
        )
      )
  )
  
  (:action do$think-3
    :precondition
      (and
        (status busy)
        (enabled $think-3)
        (inprogress $think-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Philosopher-3)
          (and (not (at $0 $Philosopher-3)) (at $1 $Philosopher-3))
        )
      )
  )
  
  (:action do$think-0
    :precondition
      (and
        (status busy)
        (enabled $think-0)
        (inprogress $think-0)
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
        (enabled $think-1)
        (inprogress $think-1)
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
  
  (:action do$take-1-2
    :precondition
      (and
        (status busy)
        (enabled $take-1-2)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $4 $Philosopher-1)
          (and (not (at $4 $Philosopher-1)) (at $5 $Philosopher-1))
        )
        (when (at $0 $Fork-2)
          (and (not (at $0 $Fork-2)) (at $1 $Fork-2))
        )
      )
  )
  
  (:action do$take-1-1
    :precondition
      (and
        (status busy)
        (enabled $take-1-1)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Philosopher-1)
          (and (not (at $1 $Philosopher-1)) (at $2 $Philosopher-1))
        )
        (when (at $0 $Fork-1)
          (and (not (at $0 $Fork-1)) (at $1 $Fork-1))
        )
      )
  )
  
  (:action do$release-3-3
    :precondition
      (and
        (status busy)
        (enabled $release-3-3)
        (inprogress $release-3-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Fork-3)
          (and (not (at $1 $Fork-3)) (at $0 $Fork-3))
        )
        (when (at $6 $Philosopher-3)
          (and (not (at $6 $Philosopher-3)) (at $7 $Philosopher-3))
        )
      )
  )
  
  (:action do$eat-all
    :precondition
      (and
        (status busy)
        (enabled $eat-all)
        (inprogress $eat-all)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $1 $Monitor-1)
          (and (not (at $1 $Monitor-1)) (at $0 $Monitor-1))
        )
        (when (at $1 $Monitor-2)
          (and (not (at $1 $Monitor-2)) (at $0 $Monitor-2))
        )
        (when (at $1 $Monitor-0)
          (and (not (at $1 $Monitor-0)) (at $0 $Monitor-0))
        )
        (when (at $1 $Monitor-3)
          (and (not (at $1 $Monitor-3)) (at $0 $Monitor-3))
        )
      )
  )
  
  (:action do$release-2-3
    :precondition
      (and
        (status busy)
        (enabled $release-2-3)
        (inprogress $release-2-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $7 $Philosopher-2)
          (and (not (at $7 $Philosopher-2)) (at $0 $Philosopher-2))
        )
        (when (at $1 $Fork-3)
          (and (not (at $1 $Fork-3)) (at $0 $Fork-3))
        )
      )
  )
  
  (:action do$release-2-2
    :precondition
      (and
        (status busy)
        (enabled $release-2-2)
        (inprogress $release-2-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $6 $Philosopher-2)
          (and (not (at $6 $Philosopher-2)) (at $7 $Philosopher-2))
        )
        (when (at $1 $Fork-2)
          (and (not (at $1 $Fork-2)) (at $0 $Fork-2))
        )
      )
  )
  
  (:action do$release-3-0
    :precondition
      (and
        (status busy)
        (enabled $release-3-0)
        (inprogress $release-3-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Fork-0)
          (and (not (at $1 $Fork-0)) (at $0 $Fork-0))
        )
        (when (at $7 $Philosopher-3)
          (and (not (at $7 $Philosopher-3)) (at $0 $Philosopher-3))
        )
      )
  )
  
  (:action do$release-1-2
    :precondition
      (and
        (status busy)
        (enabled $release-1-2)
        (inprogress $release-1-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $7 $Philosopher-1)
          (and (not (at $7 $Philosopher-1)) (at $0 $Philosopher-1))
        )
        (when (at $1 $Fork-2)
          (and (not (at $1 $Fork-2)) (at $0 $Fork-2))
        )
      )
  )
  
  (:action do$release-1-1
    :precondition
      (and
        (status busy)
        (enabled $release-1-1)
        (inprogress $release-1-1)
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
)

