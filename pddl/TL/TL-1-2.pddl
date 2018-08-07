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
    $Buffer-1 $Machine-0 $TU - LTS
    $-1 $0 $1 $2 - State
    $reject $return-1 $return-0 $get-1 $accept $get-0 $put-1 - Label
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
        (not (enabled $reject))
        (not (enabled $return-1))
        (not (enabled $return-0))
        (not (enabled $get-1))
        (not (enabled $accept))
        (not (enabled $get-0))
        (not (enabled $put-1))
        (not (inprogress $reject))
        (not (inprogress $return-1))
        (not (inprogress $return-0))
        (not (inprogress $accept))
        (not (inprogress $put-1))
        (not (ready $return-1 $Buffer-1))
        (not (ready $get-1 $Buffer-1))
        (not (ready $put-1 $Buffer-1))
        (not (ready $get-0 $Machine-0))
        (not (ready $put-1 $Machine-0))
        (not (ready $reject $TU))
        (not (ready $return-1 $TU))
        (not (ready $return-0 $TU))
        (not (ready $get-1 $TU))
        (not (ready $accept $TU))
        (not (hoop $Buffer-1))
        (not (hoop $Machine-0))
        (not (hoop $TU))
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
        (when (at $0 $Buffer-1)
          (and
            (ready $return-1 $Buffer-1)
            (ready $put-1 $Buffer-1)
            (ready $get-1 $Buffer-1)
          )
        )
        (when (at $1 $Buffer-1)
          (and
            (ready $return-1 $Buffer-1)
            (ready $put-1 $Buffer-1)
            (ready $get-1 $Buffer-1)
          )
        )
        (when (at $2 $Buffer-1)
          (and
            (ready $return-1 $Buffer-1)
            (ready $put-1 $Buffer-1)
            (ready $get-1 $Buffer-1)
          )
        )
        (when (at $0 $Machine-0)
          (ready $get-0 $Machine-0)
        )
        (when (at $1 $Machine-0)
          (and
            (ready $get-0 $Machine-0)
            (ready $put-1 $Machine-0)
          )
        )
        (when (at $2 $Machine-0)
          (ready $put-1 $Machine-0)
        )
        (when (at $0 $TU)
          (ready $get-1 $TU)
        )
        (when (at $1 $TU)
          (and
            (ready $return-1 $TU)
            (ready $accept $TU)
          )
        )
        (when (at $2 $TU)
          (ready $reject $TU)
        )
        (when (and (at $-1 $Buffer-1) (marked $-1 $Buffer-1))
          (hoop $Buffer-1)
        )
        (when (and (at $0 $Buffer-1) (marked $0 $Buffer-1))
          (hoop $Buffer-1)
        )
        (when (and (at $1 $Buffer-1) (marked $1 $Buffer-1))
          (hoop $Buffer-1)
        )
        (when (and (at $2 $Buffer-1) (marked $2 $Buffer-1))
          (hoop $Buffer-1)
        )
        (when (and (at $0 $Machine-0) (marked $0 $Machine-0))
          (hoop $Machine-0)
        )
        (when (and (at $1 $Machine-0) (marked $1 $Machine-0))
          (hoop $Machine-0)
        )
        (when (and (at $2 $Machine-0) (marked $2 $Machine-0))
          (hoop $Machine-0)
        )
        (when (and (at $0 $TU) (marked $0 $TU))
          (hoop $TU)
        )
        (when (and (at $1 $TU) (marked $1 $TU))
          (hoop $TU)
        )
        (when (and (at $2 $TU) (marked $2 $TU))
          (hoop $TU)
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
            (ready $reject $TU)
          )
          (enabled $reject)
        )
        (when
          (and
            (ready $return-1 $Buffer-1)
            (ready $return-1 $TU)
          )
          (enabled $return-1)
        )
        (when
          (and
            (ready $return-0 $TU)
          )
          (enabled $return-0)
        )
        (when
          (and
            (ready $get-1 $Buffer-1)
            (ready $get-1 $TU)
          )
          (enabled $get-1)
        )
        (when
          (and
            (ready $accept $TU)
          )
          (enabled $accept)
        )
        (when
          (and
            (ready $get-0 $Machine-0)
          )
          (enabled $get-0)
        )
        (when
          (and
            (ready $put-1 $Buffer-1)
            (ready $put-1 $Machine-0)
          )
          (enabled $put-1)
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
          (when (enabled $reject) (and (inprogress $reject) (status uncontrollable)))
          (when (enabled $return-1) (and (inprogress $return-1) (status uncontrollable)))
          (when (enabled $return-0) (and (inprogress $return-0) (status uncontrollable)))
          (when (enabled $accept) (and (inprogress $accept) (status uncontrollable)))
          (when (enabled $put-1) (and (inprogress $put-1) (status uncontrollable)))
          (when (true) (true))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $reject))
        (not (inprogress $return-1))
        (not (inprogress $return-0))
        (not (inprogress $accept))
        (not (inprogress $put-1))
      )
    :effect
      (and
        (inprogress $reject)
        (inprogress $return-1)
        (inprogress $return-0)
        (inprogress $accept)
        (inprogress $put-1)
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
        (when (at $-1 $Buffer-1) (marked $-1 $Buffer-1))
        (when (at $0 $Buffer-1) (marked $0 $Buffer-1))
        (when (at $1 $Buffer-1) (marked $1 $Buffer-1))
        (when (at $2 $Buffer-1) (marked $2 $Buffer-1))
        (when (at $0 $Machine-0) (marked $0 $Machine-0))
        (when (at $1 $Machine-0) (marked $1 $Machine-0))
        (when (at $2 $Machine-0) (marked $2 $Machine-0))
        (when (at $0 $TU) (marked $0 $TU))
        (when (at $1 $TU) (marked $1 $TU))
        (when (at $2 $TU) (marked $2 $TU))
      )
  )
  
  (:action do$reject
    :precondition
      (and
        (status busy)
        (enabled $reject)
        (inprogress $reject)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $2 $TU)
          (and (not (at $2 $TU)) (at $0 $TU))
        )
      )
  )
  
  (:action do$return-1
    :precondition
      (and
        (status busy)
        (enabled $return-1)
        (inprogress $return-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-1)
          (and (not (at $0 $Buffer-1)) (at $1 $Buffer-1))
        )
        (when (at $1 $Buffer-1)
          (and (not (at $1 $Buffer-1)) (at $2 $Buffer-1))
        )
        (when (at $2 $Buffer-1)
          (and (not (at $2 $Buffer-1)) (at $-1 $Buffer-1))
        )
        (when (at $1 $TU)
          (and (not (at $1 $TU)) (at $2 $TU))
        )
      )
  )
  
  (:action do$return-0
    :precondition
      (and
        (status busy)
        (enabled $return-0)
        (inprogress $return-0)
      )
    :effect
      (and
        (status event)
        (not (status busy))
      )
  )
  
  (:action do$get-1
    :precondition
      (and
        (status busy)
        (enabled $get-1)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-1)
          (and (not (at $0 $Buffer-1)) (at $-1 $Buffer-1))
        )
        (when (at $1 $Buffer-1)
          (and (not (at $1 $Buffer-1)) (at $0 $Buffer-1))
        )
        (when (at $2 $Buffer-1)
          (and (not (at $2 $Buffer-1)) (at $1 $Buffer-1))
        )
        (when (at $0 $TU)
          (and (not (at $0 $TU)) (at $1 $TU))
        )
      )
  )
  
  (:action do$accept
    :precondition
      (and
        (status busy)
        (enabled $accept)
        (inprogress $accept)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (status complete)
        (when (at $1 $TU)
          (and (not (at $1 $TU)) (at $0 $TU))
        )
      )
  )
  
  (:action do$get-0
    :precondition
      (and
        (status busy)
        (enabled $get-0)
        (not (status uncontrollable))
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Machine-0)
          (and (not (at $0 $Machine-0)) (at $1 $Machine-0))
        )
        (when (at $1 $Machine-0)
          (and (not (at $1 $Machine-0)) (at $2 $Machine-0))
        )
      )
  )
  
  (:action do$put-1
    :precondition
      (and
        (status busy)
        (enabled $put-1)
        (inprogress $put-1)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-1)
          (and (not (at $0 $Buffer-1)) (at $1 $Buffer-1))
        )
        (when (at $1 $Buffer-1)
          (and (not (at $1 $Buffer-1)) (at $2 $Buffer-1))
        )
        (when (at $2 $Buffer-1)
          (and (not (at $2 $Buffer-1)) (at $-1 $Buffer-1))
        )
        (when (at $1 $Machine-0)
          (and (not (at $1 $Machine-0)) (at $0 $Machine-0))
        )
        (when (at $2 $Machine-0)
          (and (not (at $2 $Machine-0)) (at $1 $Machine-0))
        )
      )
  )
)

