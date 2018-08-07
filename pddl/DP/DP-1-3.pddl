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
    $Philosopher-0 $Monitor-0 $Fork-0 - LTS
    $0 $1 $2 $3 $4 $5 $6 $7 $8 - State
    $eat-0 $think-0 $step-0 $eat-all $take-0-0 $release-0-0 - Label
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
        (not (enabled $think-0))
        (not (enabled $step-0))
        (not (enabled $eat-all))
        (not (enabled $take-0-0))
        (not (enabled $release-0-0))
        (not (inprogress $eat-0))
        (not (inprogress $think-0))
        (not (inprogress $step-0))
        (not (inprogress $eat-all))
        (not (inprogress $release-0-0))
        (not (ready $eat-0 $Philosopher-0))
        (not (ready $think-0 $Philosopher-0))
        (not (ready $step-0 $Philosopher-0))
        (not (ready $take-0-0 $Philosopher-0))
        (not (ready $release-0-0 $Philosopher-0))
        (not (ready $eat-0 $Monitor-0))
        (not (ready $eat-all $Monitor-0))
        (not (ready $take-0-0 $Fork-0))
        (not (ready $release-0-0 $Fork-0))
        (not (hoop $Philosopher-0))
        (not (hoop $Monitor-0))
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
          (ready $step-0 $Philosopher-0)
        )
        (when (at $5 $Philosopher-0)
          (ready $take-0-0 $Philosopher-0)
        )
        (when (at $6 $Philosopher-0)
          (ready $eat-0 $Philosopher-0)
        )
        (when (at $7 $Philosopher-0)
          (ready $release-0-0 $Philosopher-0)
        )
        (when (at $8 $Philosopher-0)
          (ready $release-0-0 $Philosopher-0)
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
        (when (at $0 $Fork-0)
          (ready $take-0-0 $Fork-0)
        )
        (when (at $1 $Fork-0)
          (ready $release-0-0 $Fork-0)
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
        (when (and (at $0 $Monitor-0) (marked $0 $Monitor-0))
          (hoop $Monitor-0)
        )
        (when (and (at $1 $Monitor-0) (marked $1 $Monitor-0))
          (hoop $Monitor-0)
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
            (ready $eat-0 $Monitor-0)
          )
          (enabled $eat-0)
        )
        (when
          (and
            (ready $think-0 $Philosopher-0)
          )
          (enabled $think-0)
        )
        (when
          (and
            (ready $step-0 $Philosopher-0)
          )
          (enabled $step-0)
        )
        (when
          (and
            (ready $eat-all $Monitor-0)
          )
          (enabled $eat-all)
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
            (ready $release-0-0 $Philosopher-0)
            (ready $release-0-0 $Fork-0)
          )
          (enabled $release-0-0)
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
          (when (enabled $think-0) (and (inprogress $think-0) (status uncontrollable)))
          (when (enabled $step-0) (and (inprogress $step-0) (status uncontrollable)))
          (when (enabled $eat-all) (and (inprogress $eat-all) (status uncontrollable)))
          (when (enabled $release-0-0) (and (inprogress $release-0-0) (status uncontrollable)))
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
        (not (inprogress $think-0))
        (not (inprogress $step-0))
        (not (inprogress $eat-all))
        (not (inprogress $release-0-0))
      )
    :effect
      (and
        (inprogress $eat-0)
        (inprogress $think-0)
        (inprogress $step-0)
        (inprogress $eat-all)
        (inprogress $release-0-0)
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
        (when (at $0 $Monitor-0) (marked $0 $Monitor-0))
        (when (at $1 $Monitor-0) (marked $1 $Monitor-0))
        (when (at $0 $Fork-0) (marked $0 $Fork-0))
        (when (at $1 $Fork-0) (marked $1 $Fork-0))
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
        (when (at $6 $Philosopher-0)
          (and (not (at $6 $Philosopher-0)) (at $7 $Philosopher-0))
        )
        (when (at $0 $Monitor-0)
          (and (not (at $0 $Monitor-0)) (at $1 $Monitor-0))
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
        (when (at $4 $Philosopher-0)
          (and (not (at $4 $Philosopher-0)) (at $5 $Philosopher-0))
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
        (when (at $1 $Monitor-0)
          (and (not (at $1 $Monitor-0)) (at $0 $Monitor-0))
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
        (when (at $5 $Philosopher-0)
          (and (not (at $5 $Philosopher-0)) (at $6 $Philosopher-0))
        )
        (when (at $0 $Fork-0)
          (and (not (at $0 $Fork-0)) (at $1 $Fork-0))
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
        (when (at $7 $Philosopher-0)
          (and (not (at $7 $Philosopher-0)) (at $8 $Philosopher-0))
        )
        (when (at $8 $Philosopher-0)
          (and (not (at $8 $Philosopher-0)) (at $0 $Philosopher-0))
        )
        (when (at $1 $Fork-0)
          (and (not (at $1 $Fork-0)) (at $0 $Fork-0))
        )
      )
  )
)

