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
    $Document $Crew-0 - LTS
    $-1 $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 - State
    $reject-0-2 $refuse $reject-0-1 $accept-0 $approve $assign-0 $reject-0-4 $reject-0-3 $reject-0-6 $reject-0-5 - Label
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
        (not (enabled $reject-0-2))
        (not (enabled $refuse))
        (not (enabled $reject-0-1))
        (not (enabled $accept-0))
        (not (enabled $approve))
        (not (enabled $assign-0))
        (not (enabled $reject-0-4))
        (not (enabled $reject-0-3))
        (not (enabled $reject-0-6))
        (not (enabled $reject-0-5))
        (not (inprogress $reject-0-2))
        (not (inprogress $accept-0))
        (not (inprogress $reject-0-1))
        (not (inprogress $reject-0-4))
        (not (inprogress $reject-0-3))
        (not (inprogress $reject-0-6))
        (not (inprogress $reject-0-5))
        (not (ready $accept-0 $Document))
        (not (ready $refuse $Document))
        (not (ready $approve $Document))
        (not (ready $reject-0-6 $Document))
        (not (ready $reject-0-2 $Crew-0))
        (not (ready $refuse $Crew-0))
        (not (ready $reject-0-1 $Crew-0))
        (not (ready $accept-0 $Crew-0))
        (not (ready $approve $Crew-0))
        (not (ready $assign-0 $Crew-0))
        (not (ready $reject-0-4 $Crew-0))
        (not (ready $reject-0-3 $Crew-0))
        (not (ready $reject-0-6 $Crew-0))
        (not (ready $reject-0-5 $Crew-0))
        (not (hoop $Document))
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
            (ready $reject-0-6 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
          )
        )
        (when (at $1 $Document)
          (and
            (ready $accept-0 $Document)
            (ready $reject-0-6 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
          )
        )
        (when (at $2 $Document)
          (and
            (ready $accept-0 $Document)
            (ready $reject-0-6 $Document)
            (ready $refuse $Document)
            (ready $approve $Document)
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
            (ready $reject-0-2 $Crew-0)
            (ready $accept-0 $Crew-0)
          )
        )
        (when (at $4 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $5 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $6 $Crew-0)
          (and
            (ready $accept-0 $Crew-0)
            (ready $reject-0-3 $Crew-0)
          )
        )
        (when (at $7 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $8 $Crew-0)
          (and
            (ready $accept-0 $Crew-0)
            (ready $reject-0-4 $Crew-0)
          )
        )
        (when (at $9 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $10 $Crew-0)
          (and
            (ready $accept-0 $Crew-0)
            (ready $reject-0-5 $Crew-0)
          )
        )
        (when (at $11 $Crew-0)
          (and
            (ready $assign-0 $Crew-0)
            (ready $refuse $Crew-0)
            (ready $approve $Crew-0)
          )
        )
        (when (at $12 $Crew-0)
          (and
            (ready $accept-0 $Crew-0)
            (ready $reject-0-6 $Crew-0)
          )
        )
        (when (at $13 $Crew-0)
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
        (when (and (at $4 $Crew-0) (marked $4 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $5 $Crew-0) (marked $5 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $6 $Crew-0) (marked $6 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $7 $Crew-0) (marked $7 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $8 $Crew-0) (marked $8 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $9 $Crew-0) (marked $9 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $10 $Crew-0) (marked $10 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $11 $Crew-0) (marked $11 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $12 $Crew-0) (marked $12 $Crew-0))
          (hoop $Crew-0)
        )
        (when (and (at $13 $Crew-0) (marked $13 $Crew-0))
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
            (ready $reject-0-2 $Crew-0)
          )
          (enabled $reject-0-2)
        )
        (when
          (and
            (ready $refuse $Document)
            (ready $refuse $Crew-0)
          )
          (enabled $refuse)
        )
        (when
          (and
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
            (ready $reject-0-4 $Crew-0)
          )
          (enabled $reject-0-4)
        )
        (when
          (and
            (ready $reject-0-3 $Crew-0)
          )
          (enabled $reject-0-3)
        )
        (when
          (and
            (ready $reject-0-6 $Document)
            (ready $reject-0-6 $Crew-0)
          )
          (enabled $reject-0-6)
        )
        (when
          (and
            (ready $reject-0-5 $Crew-0)
          )
          (enabled $reject-0-5)
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
          (when (enabled $reject-0-2) (and (inprogress $reject-0-2) (status uncontrollable)))
          (when (enabled $accept-0) (and (inprogress $accept-0) (status uncontrollable)))
          (when (enabled $reject-0-1) (and (inprogress $reject-0-1) (status uncontrollable)))
          (when (enabled $reject-0-4) (and (inprogress $reject-0-4) (status uncontrollable)))
          (when (enabled $reject-0-3) (and (inprogress $reject-0-3) (status uncontrollable)))
          (when (enabled $reject-0-6) (and (inprogress $reject-0-6) (status uncontrollable)))
          (when (enabled $reject-0-5) (and (inprogress $reject-0-5) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $reject-0-2))
        (not (inprogress $accept-0))
        (not (inprogress $reject-0-1))
        (not (inprogress $reject-0-4))
        (not (inprogress $reject-0-3))
        (not (inprogress $reject-0-6))
        (not (inprogress $reject-0-5))
      )
    :effect
      (and
        (inprogress $reject-0-2)
        (inprogress $accept-0)
        (inprogress $reject-0-1)
        (inprogress $reject-0-4)
        (inprogress $reject-0-3)
        (inprogress $reject-0-6)
        (inprogress $reject-0-5)
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
        (when (at $-1 $Crew-0) (marked $-1 $Crew-0))
        (when (at $0 $Crew-0) (marked $0 $Crew-0))
        (when (at $1 $Crew-0) (marked $1 $Crew-0))
        (when (at $2 $Crew-0) (marked $2 $Crew-0))
        (when (at $3 $Crew-0) (marked $3 $Crew-0))
        (when (at $4 $Crew-0) (marked $4 $Crew-0))
        (when (at $5 $Crew-0) (marked $5 $Crew-0))
        (when (at $6 $Crew-0) (marked $6 $Crew-0))
        (when (at $7 $Crew-0) (marked $7 $Crew-0))
        (when (at $8 $Crew-0) (marked $8 $Crew-0))
        (when (at $9 $Crew-0) (marked $9 $Crew-0))
        (when (at $10 $Crew-0) (marked $10 $Crew-0))
        (when (at $11 $Crew-0) (marked $11 $Crew-0))
        (when (at $12 $Crew-0) (marked $12 $Crew-0))
        (when (at $13 $Crew-0) (marked $13 $Crew-0))
      )
  )
  
  (:action do$reject-0-2
    :precondition
      (and
        (status busy)
        (enabled $reject-0-2)
        (inprogress $reject-0-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $3 $Crew-0)
          (and (not (at $3 $Crew-0)) (at $5 $Crew-0))
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
        (when (at $0 $Crew-0)
          (and (not (at $0 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $2 $Crew-0)
          (and (not (at $2 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $4 $Crew-0)
          (and (not (at $4 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $5 $Crew-0)
          (and (not (at $5 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $7 $Crew-0)
          (and (not (at $7 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $9 $Crew-0)
          (and (not (at $9 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $11 $Crew-0)
          (and (not (at $11 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $13 $Crew-0)
          (and (not (at $13 $Crew-0)) (at $0 $Crew-0))
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
        (when (at $1 $Crew-0)
          (and (not (at $1 $Crew-0)) (at $4 $Crew-0))
        )
        (when (at $3 $Crew-0)
          (and (not (at $3 $Crew-0)) (at $4 $Crew-0))
        )
        (when (at $6 $Crew-0)
          (and (not (at $6 $Crew-0)) (at $4 $Crew-0))
        )
        (when (at $8 $Crew-0)
          (and (not (at $8 $Crew-0)) (at $4 $Crew-0))
        )
        (when (at $10 $Crew-0)
          (and (not (at $10 $Crew-0)) (at $4 $Crew-0))
        )
        (when (at $12 $Crew-0)
          (and (not (at $12 $Crew-0)) (at $4 $Crew-0))
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
          (and (not (at $2 $Document)) (at $0 $Document))
        )
        (when (at $0 $Crew-0)
          (and (not (at $0 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $2 $Crew-0)
          (and (not (at $2 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $4 $Crew-0)
          (and (not (at $4 $Crew-0)) (at $0 $Crew-0))
        )
        (when (at $5 $Crew-0)
          (and (not (at $5 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $7 $Crew-0)
          (and (not (at $7 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $9 $Crew-0)
          (and (not (at $9 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $11 $Crew-0)
          (and (not (at $11 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $13 $Crew-0)
          (and (not (at $13 $Crew-0)) (at $-1 $Crew-0))
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
          (and (not (at $2 $Crew-0)) (at $3 $Crew-0))
        )
        (when (at $4 $Crew-0)
          (and (not (at $4 $Crew-0)) (at $-1 $Crew-0))
        )
        (when (at $5 $Crew-0)
          (and (not (at $5 $Crew-0)) (at $6 $Crew-0))
        )
        (when (at $7 $Crew-0)
          (and (not (at $7 $Crew-0)) (at $8 $Crew-0))
        )
        (when (at $9 $Crew-0)
          (and (not (at $9 $Crew-0)) (at $10 $Crew-0))
        )
        (when (at $11 $Crew-0)
          (and (not (at $11 $Crew-0)) (at $12 $Crew-0))
        )
        (when (at $13 $Crew-0)
          (and (not (at $13 $Crew-0)) (at $-1 $Crew-0))
        )
      )
  )
  
  (:action do$reject-0-4
    :precondition
      (and
        (status busy)
        (enabled $reject-0-4)
        (inprogress $reject-0-4)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $8 $Crew-0)
          (and (not (at $8 $Crew-0)) (at $9 $Crew-0))
        )
      )
  )
  
  (:action do$reject-0-3
    :precondition
      (and
        (status busy)
        (enabled $reject-0-3)
        (inprogress $reject-0-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $6 $Crew-0)
          (and (not (at $6 $Crew-0)) (at $7 $Crew-0))
        )
      )
  )
  
  (:action do$reject-0-6
    :precondition
      (and
        (status busy)
        (enabled $reject-0-6)
        (inprogress $reject-0-6)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Document)
          (and (not (at $0 $Document)) (at $1 $Document))
        )
        (when (at $12 $Crew-0)
          (and (not (at $12 $Crew-0)) (at $13 $Crew-0))
        )
      )
  )
  
  (:action do$reject-0-5
    :precondition
      (and
        (status busy)
        (enabled $reject-0-5)
        (inprogress $reject-0-5)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $10 $Crew-0)
          (and (not (at $10 $Crew-0)) (at $11 $Crew-0))
        )
      )
  )
)

