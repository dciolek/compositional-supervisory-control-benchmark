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
    $Document $Crew-1 $Crew-0 - LTS
    $-1 $0 $1 $2 $3 - State
    $accept-1 $assign-1 $refuse $reject-0-1 $accept-0 $approve $assign-0 $reject-1-1 - Label
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
        (not (enabled $accept-1))
        (not (enabled $assign-1))
        (not (enabled $refuse))
        (not (enabled $reject-0-1))
        (not (enabled $accept-0))
        (not (enabled $approve))
        (not (enabled $assign-0))
        (not (enabled $reject-1-1))
        (not (inprogress $accept-1))
        (not (inprogress $accept-0))
        (not (inprogress $reject-0-1))
        (not (inprogress $reject-1-1))
        (not (ready $accept-1 $Document))
        (not (ready $reject-0-1 $Document))
        (not (ready $accept-0 $Document))
        (not (ready $refuse $Document))
        (not (ready $approve $Document))
        (not (ready $reject-1-1 $Document))
        (not (ready $accept-1 $Crew-1))
        (not (ready $refuse $Crew-1))
        (not (ready $assign-1 $Crew-1))
        (not (ready $approve $Crew-1))
        (not (ready $reject-1-1 $Crew-1))
        (not (ready $refuse $Crew-0))
        (not (ready $reject-0-1 $Crew-0))
        (not (ready $accept-0 $Crew-0))
        (not (ready $approve $Crew-0))
        (not (ready $assign-0 $Crew-0))
        (not (hoop $Document))
        (not (hoop $Crew-1))
        (not (hoop $Crew-0))
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
        (when (at $0 $Document)
          (and
            (ready $accept-0 $Document)
            (ready $reject-1-1 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
            (ready $reject-0-1 $Document)
            (ready $accept-1 $Document)
          )
        )
        (when (at $1 $Document)
          (and
            (ready $accept-0 $Document)
            (ready $reject-1-1 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
            (ready $reject-0-1 $Document)
            (ready $accept-1 $Document)
          )
        )
        (when (at $2 $Document)
          (and
            (ready $accept-0 $Document)
            (ready $reject-1-1 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
            (ready $reject-0-1 $Document)
            (ready $accept-1 $Document)
          )
        )
        (when (at $3 $Document)
          (and
            (ready $accept-0 $Document)
            (ready $reject-1-1 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
            (ready $reject-0-1 $Document)
            (ready $accept-1 $Document)
          )
        )
        (when (at $0 $Crew-1)
          (and
            (ready $assign-1 $Crew-1)
            (ready $refuse $Crew-1)
            (ready $approve $Crew-1)
          )
        )
        (when (at $1 $Crew-1)
          (and
            (ready $reject-1-1 $Crew-1)
            (ready $accept-1 $Crew-1)
          )
        )
        (when (at $2 $Crew-1)
          (and
            (ready $assign-1 $Crew-1)
            (ready $refuse $Crew-1)
            (ready $approve $Crew-1)
          )
        )
        (when (at $3 $Crew-1)
          (and
            (ready $assign-1 $Crew-1)
            (ready $refuse $Crew-1)
            (ready $approve $Crew-1)
          )
        )
        (when (at $0 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $1 $Crew-0)
          (and
            (ready $accept-0 $Crew-0)
            (ready $reject-0-1 $Crew-0)
          )
        )
        (when (at $2 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $3 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (and (at $-1 $Document) (marked $-1 $Document))
          (hoop $Document)
        )
        (when (and (at $0 $Document) (marked $0 $Document))
          (hoop $Document)
        )
        (when (and (at $1 $Document) (marked $1 $Document))
          (hoop $Document)
        )
        (when (and (at $2 $Document) (marked $2 $Document))
          (hoop $Document)
        )
        (when (and (at $3 $Document) (marked $3 $Document))
          (hoop $Document)
        )
        (when (and (at $-1 $Crew-1) (marked $-1 $Crew-1))
          (hoop $Crew-1)
        )
        (when (and (at $0 $Crew-1) (marked $0 $Crew-1))
          (hoop $Crew-1)
        )
        (when (and (at $1 $Crew-1) (marked $1 $Crew-1))
          (hoop $Crew-1)
        )
        (when (and (at $2 $Crew-1) (marked $2 $Crew-1))
          (hoop $Crew-1)
        )
        (when (and (at $3 $Crew-1) (marked $3 $Crew-1))
          (hoop $Crew-1)
        )
        (when (and (at $-1 $Crew-0) (marked $-1 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $0 $Crew-0) (marked $0 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $1 $Crew-0) (marked $1 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $2 $Crew-0) (marked $2 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $3 $Crew-0) (marked $3 $Crew-0))
          (hoop $Crew-0)
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
            (ready $accept-1 $Document)
            (ready $accept-1 $Crew-1)
          )
          (enabled $accept-1)
        )
        (when
          (and
            (ready $assign-1 $Crew-1)
          )
          (enabled $assign-1)
        )
        (when
          (and
            (ready $refuse $Document)
            (ready $refuse $Crew-1)
            (ready $refuse $Crew-0)
          )
          (enabled $refuse)
        )
        (when
          (and
            (ready $reject-0-1 $Document)
            (ready $reject-0-1 $Crew-0)
          )
          (enabled $reject-0-1)
        )
        (when
          (and
            (ready $accept-0 $Document)
            (ready $accept-0 $Crew-0)
          )
          (enabled $accept-0)
        )
        (when
          (and
            (ready $approve $Document)
            (ready $approve $Crew-1)
            (ready $approve $Crew-0)
          )
          (enabled $approve)
        )
        (when
          (and
            (ready $assign-0 $Crew-0)
          )
          (enabled $assign-0)
        )
        (when
          (and
            (ready $reject-1-1 $Document)
            (ready $reject-1-1 $Crew-1)
          )
          (enabled $reject-1-1)
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
          (when (enabled $accept-1) (and (inprogress $accept-1) (status uncontrollable)))
          (when (enabled $accept-0) (and (inprogress $accept-0) (status uncontrollable)))
          (when (enabled $reject-0-1) (and (inprogress $reject-0-1) (status uncontrollable)))
          (when (enabled $reject-1-1) (and (inprogress $reject-1-1) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $accept-1))
        (not (inprogress $accept-0))
        (not (inprogress $reject-0-1))
        (not (inprogress $reject-1-1))
      )
    :effect
      (and
        (inprogress $accept-1)
        (inprogress $accept-0)
        (inprogress $reject-0-1)
        (inprogress $reject-1-1)
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
        (when (at $-1 $Document) (marked $-1 $Document))
        (when (at $0 $Document) (marked $0 $Document))
        (when (at $1 $Document) (marked $1 $Document))
        (when (at $2 $Document) (marked $2 $Document))
        (when (at $3 $Document) (marked $3 $Document))
        (when (at $-1 $Crew-1) (marked $-1 $Crew-1))
        (when (at $0 $Crew-1) (marked $0 $Crew-1))
        (when (at $1 $Crew-1) (marked $1 $Crew-1))
        (when (at $2 $Crew-1) (marked $2 $Crew-1))
        (when (at $3 $Crew-1) (marked $3 $Crew-1))
        (when (at $-1 $Crew-0) (marked $-1 $Crew-0))
        (when (at $0 $Crew-0) (marked $0 $Crew-0))
        (when (at $1 $Crew-0) (marked $1 $Crew-0))
        (when (at $2 $Crew-0) (marked $2 $Crew-0))
        (when (at $3 $Crew-0) (marked $3 $Crew-0))
      )
  )
  
  (:action do$accept-1
    :precondition
      (and
        (status busy)
        (enabled $accept-1)
        (inprogress $accept-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Document)
          (and (not (at $0 $Document)) (at $2 $Document))
        )
        (when (at $2 $Document)
          (and (not (at $2 $Document)) (at $3 $Document))
        )
        (when (at $1 $Crew-1)
          (and (not (at $1 $Crew-1)) (at $3 $Crew-1))
        )
      )
  )
  
  (:action do$assign-1
    :precondition
      (and
        (status busy)
        (enabled $assign-1)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Crew-1)
          (and (not (at $0 $Crew-1)) (at $1 $Crew-1))
        )
        (when (at $2 $Crew-1)
          (and (not (at $2 $Crew-1)) (at $-1 $Crew-1))
        )
        (when (at $3 $Crew-1)
          (and (not (at $3 $Crew-1)) (at $-1 $Crew-1))
        )
      )
  )
  
  (:action do$refuse
    :precondition
      (and
        (status busy)
        (enabled $refuse)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $1 $Document)
          (and (not (at $1 $Document)) (at $0 $Document))
        )
        (when (at $2 $Document)
          (and (not (at $2 $Document)) (at $-1 $Document))
        )
        (when (at $3 $Document)
          (and (not (at $3 $Document)) (at $-1 $Document))
        )
        (when (at $0 $Crew-1)
          (and (not (at $0 $Crew-1)) (at $-1 $Crew-1))
        )
        (when (at $2 $Crew-1)
          (and (not (at $2 $Crew-1)) (at $0 $Crew-1))
        )
        (when (at $3 $Crew-1)
          (and (not (at $3 $Crew-1)) (at $0 $Crew-1))
        )
        (when (at $0 $Crew-0)
          (and (not (at $0 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $2 $Crew-0)
          (and (not (at $2 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $3 $Crew-0)
          (and (not (at $3 $Crew-0)) (at $0 $Crew-0))
        )
      )
  )
  
  (:action do$reject-0-1
    :precondition
      (and
        (status busy)
        (enabled $reject-0-1)
        (inprogress $reject-0-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Document)
          (and (not (at $0 $Document)) (at $1 $Document))
        )
        (when (at $2 $Document)
          (and (not (at $2 $Document)) (at $1 $Document))
        )
        (when (at $1 $Crew-0)
          (and (not (at $1 $Crew-0)) (at $2 $Crew-0))
        )
      )
  )
  
  (:action do$accept-0
    :precondition
      (and
        (status busy)
        (enabled $accept-0)
        (inprogress $accept-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Document)
          (and (not (at $0 $Document)) (at $2 $Document))
        )
        (when (at $2 $Document)
          (and (not (at $2 $Document)) (at $3 $Document))
        )
        (when (at $1 $Crew-0)
          (and (not (at $1 $Crew-0)) (at $3 $Crew-0))
        )
      )
  )
  
  (:action do$approve
    :precondition
      (and
        (status busy)
        (enabled $approve)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $0 $Document)
          (and (not (at $0 $Document)) (at $-1 $Document))
        )
        (when (at $1 $Document)
          (and (not (at $1 $Document)) (at $-1 $Document))
        )
        (when (at $2 $Document)
          (and (not (at $2 $Document)) (at $-1 $Document))
        )
        (when (at $3 $Document)
          (and (not (at $3 $Document)) (at $0 $Document))
        )
        (when (at $0 $Crew-1)
          (and (not (at $0 $Crew-1)) (at $-1 $Crew-1))
        )
        (when (at $2 $Crew-1)
          (and (not (at $2 $Crew-1)) (at $-1 $Crew-1))
        )
        (when (at $3 $Crew-1)
          (and (not (at $3 $Crew-1)) (at $0 $Crew-1))
        )
        (when (at $0 $Crew-0)
          (and (not (at $0 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $2 $Crew-0)
          (and (not (at $2 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $3 $Crew-0)
          (and (not (at $3 $Crew-0)) (at $0 $Crew-0))
        )
      )
  )
  
  (:action do$assign-0
    :precondition
      (and
        (status busy)
        (enabled $assign-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Crew-0)
          (and (not (at $0 $Crew-0)) (at $1 $Crew-0))
        )
        (when (at $2 $Crew-0)
          (and (not (at $2 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $3 $Crew-0)
          (and (not (at $3 $Crew-0)) (at $-1 $Crew-0))
        )
      )
  )
  
  (:action do$reject-1-1
    :precondition
      (and
        (status busy)
        (enabled $reject-1-1)
        (inprogress $reject-1-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Document)
          (and (not (at $0 $Document)) (at $1 $Document))
        )
        (when (at $2 $Document)
          (and (not (at $2 $Document)) (at $1 $Document))
        )
        (when (at $1 $Crew-1)
          (and (not (at $1 $Crew-1)) (at $2 $Crew-1))
        )
      )
  )
)

