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
    $Machine-3 $Buffer-1 $Machine-0 $Machine-1 $Buffer-2 $TU $Buffer-3 $Machine-2 $Buffer-4 - LTS
    $-1 $0 $1 $2 $3 - State
    $return-4 $return-3 $return-2 $reject $get-4 $get-3 $return-1 $get-2 $return-0 $get-1 $accept $get-0 $put-4 $put-3 $put-2 $end $put-1 - Label
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
        (not (enabled $return-4))
        (not (enabled $return-3))
        (not (enabled $return-2))
        (not (enabled $reject))
        (not (enabled $get-4))
        (not (enabled $get-3))
        (not (enabled $return-1))
        (not (enabled $get-2))
        (not (enabled $return-0))
        (not (enabled $get-1))
        (not (enabled $accept))
        (not (enabled $get-0))
        (not (enabled $put-4))
        (not (enabled $put-3))
        (not (enabled $put-2))
        (not (enabled $end))
        (not (enabled $put-1))
        (not (inprogress $return-4))
        (not (inprogress $return-3))
        (not (inprogress $reject))
        (not (inprogress $return-2))
        (not (inprogress $return-1))
        (not (inprogress $return-0))
        (not (inprogress $accept))
        (not (inprogress $put-4))
        (not (inprogress $put-3))
        (not (inprogress $end))
        (not (inprogress $put-2))
        (not (inprogress $put-1))
        (not (ready $get-3 $Machine-3))
        (not (ready $put-4 $Machine-3))
        (not (ready $return-1 $Buffer-1))
        (not (ready $get-1 $Buffer-1))
        (not (ready $put-1 $Buffer-1))
        (not (ready $get-0 $Machine-0))
        (not (ready $put-1 $Machine-0))
        (not (ready $get-1 $Machine-1))
        (not (ready $put-2 $Machine-1))
        (not (ready $return-2 $Buffer-2))
        (not (ready $get-2 $Buffer-2))
        (not (ready $put-2 $Buffer-2))
        (not (ready $return-4 $TU))
        (not (ready $return-3 $TU))
        (not (ready $get-4 $TU))
        (not (ready $reject $TU))
        (not (ready $return-2 $TU))
        (not (ready $return-1 $TU))
        (not (ready $return-0 $TU))
        (not (ready $accept $TU))
        (not (ready $end $TU))
        (not (ready $return-3 $Buffer-3))
        (not (ready $get-3 $Buffer-3))
        (not (ready $put-3 $Buffer-3))
        (not (ready $get-2 $Machine-2))
        (not (ready $put-3 $Machine-2))
        (not (ready $return-4 $Buffer-4))
        (not (ready $get-4 $Buffer-4))
        (not (ready $put-4 $Buffer-4))
        (not (hoop $Machine-3))
        (not (hoop $Buffer-1))
        (not (hoop $Machine-0))
        (not (hoop $Machine-1))
        (not (hoop $Buffer-2))
        (not (hoop $TU))
        (not (hoop $Buffer-3))
        (not (hoop $Machine-2))
        (not (hoop $Buffer-4))
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
        (when (at $0 $Machine-3)
          (ready $get-3 $Machine-3)
        )
        (when (at $1 $Machine-3)
          (and
            (ready $get-3 $Machine-3)
            (ready $put-4 $Machine-3)
          )
        )
        (when (at $2 $Machine-3)
          (ready $put-4 $Machine-3)
        )
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
        (when (at $0 $Machine-1)
          (ready $get-1 $Machine-1)
        )
        (when (at $1 $Machine-1)
          (and
            (ready $put-2 $Machine-1)
            (ready $get-1 $Machine-1)
          )
        )
        (when (at $2 $Machine-1)
          (ready $put-2 $Machine-1)
        )
        (when (at $0 $Buffer-2)
          (and
            (ready $return-2 $Buffer-2)
            (ready $put-2 $Buffer-2)
            (ready $get-2 $Buffer-2)
          )
        )
        (when (at $1 $Buffer-2)
          (and
            (ready $return-2 $Buffer-2)
            (ready $put-2 $Buffer-2)
            (ready $get-2 $Buffer-2)
          )
        )
        (when (at $2 $Buffer-2)
          (and
            (ready $return-2 $Buffer-2)
            (ready $put-2 $Buffer-2)
            (ready $get-2 $Buffer-2)
          )
        )
        (when (at $0 $TU)
          (ready $get-4 $TU)
        )
        (when (at $1 $TU)
          (and
            (ready $return-1 $TU)
            (ready $accept $TU)
          )
        )
        (when (at $2 $TU)
          (ready $end $TU)
        )
        (when (at $3 $TU)
          (ready $reject $TU)
        )
        (when (at $0 $Buffer-3)
          (and
            (ready $get-3 $Buffer-3)
            (ready $return-3 $Buffer-3)
            (ready $put-3 $Buffer-3)
          )
        )
        (when (at $1 $Buffer-3)
          (and
            (ready $get-3 $Buffer-3)
            (ready $return-3 $Buffer-3)
            (ready $put-3 $Buffer-3)
          )
        )
        (when (at $2 $Buffer-3)
          (and
            (ready $get-3 $Buffer-3)
            (ready $return-3 $Buffer-3)
            (ready $put-3 $Buffer-3)
          )
        )
        (when (at $0 $Machine-2)
          (ready $get-2 $Machine-2)
        )
        (when (at $1 $Machine-2)
          (and
            (ready $put-3 $Machine-2)
            (ready $get-2 $Machine-2)
          )
        )
        (when (at $2 $Machine-2)
          (ready $put-3 $Machine-2)
        )
        (when (at $0 $Buffer-4)
          (and
            (ready $put-4 $Buffer-4)
            (ready $return-4 $Buffer-4)
            (ready $get-4 $Buffer-4)
          )
        )
        (when (at $1 $Buffer-4)
          (and
            (ready $put-4 $Buffer-4)
            (ready $return-4 $Buffer-4)
            (ready $get-4 $Buffer-4)
          )
        )
        (when (at $2 $Buffer-4)
          (and
            (ready $put-4 $Buffer-4)
            (ready $return-4 $Buffer-4)
            (ready $get-4 $Buffer-4)
          )
        )
        (when (and (at $0 $Machine-3) (marked $0 $Machine-3))
          (hoop $Machine-3)
        )
        (when (and (at $1 $Machine-3) (marked $1 $Machine-3))
          (hoop $Machine-3)
        )
        (when (and (at $2 $Machine-3) (marked $2 $Machine-3))
          (hoop $Machine-3)
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
        (when (and (at $0 $Machine-1) (marked $0 $Machine-1))
          (hoop $Machine-1)
        )
        (when (and (at $1 $Machine-1) (marked $1 $Machine-1))
          (hoop $Machine-1)
        )
        (when (and (at $2 $Machine-1) (marked $2 $Machine-1))
          (hoop $Machine-1)
        )
        (when (and (at $-1 $Buffer-2) (marked $-1 $Buffer-2))
          (hoop $Buffer-2)
        )
        (when (and (at $0 $Buffer-2) (marked $0 $Buffer-2))
          (hoop $Buffer-2)
        )
        (when (and (at $1 $Buffer-2) (marked $1 $Buffer-2))
          (hoop $Buffer-2)
        )
        (when (and (at $2 $Buffer-2) (marked $2 $Buffer-2))
          (hoop $Buffer-2)
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
        (when (and (at $3 $TU) (marked $3 $TU))
          (hoop $TU)
        )
        (when (and (at $-1 $Buffer-3) (marked $-1 $Buffer-3))
          (hoop $Buffer-3)
        )
        (when (and (at $0 $Buffer-3) (marked $0 $Buffer-3))
          (hoop $Buffer-3)
        )
        (when (and (at $1 $Buffer-3) (marked $1 $Buffer-3))
          (hoop $Buffer-3)
        )
        (when (and (at $2 $Buffer-3) (marked $2 $Buffer-3))
          (hoop $Buffer-3)
        )
        (when (and (at $0 $Machine-2) (marked $0 $Machine-2))
          (hoop $Machine-2)
        )
        (when (and (at $1 $Machine-2) (marked $1 $Machine-2))
          (hoop $Machine-2)
        )
        (when (and (at $2 $Machine-2) (marked $2 $Machine-2))
          (hoop $Machine-2)
        )
        (when (and (at $-1 $Buffer-4) (marked $-1 $Buffer-4))
          (hoop $Buffer-4)
        )
        (when (and (at $0 $Buffer-4) (marked $0 $Buffer-4))
          (hoop $Buffer-4)
        )
        (when (and (at $1 $Buffer-4) (marked $1 $Buffer-4))
          (hoop $Buffer-4)
        )
        (when (and (at $2 $Buffer-4) (marked $2 $Buffer-4))
          (hoop $Buffer-4)
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
            (ready $return-4 $TU)
            (ready $return-4 $Buffer-4)
          )
          (and
            (enabled $return-4)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $return-3 $TU)
            (ready $return-3 $Buffer-3)
          )
          (and
            (enabled $return-3)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $return-2 $Buffer-2)
            (ready $return-2 $TU)
          )
          (and
            (enabled $return-2)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $reject $TU)
          )
          (and
            (enabled $reject)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $get-4 $TU)
            (ready $get-4 $Buffer-4)
          )
          (enabled $get-4)
        )
        (when
          (and
            (ready $get-3 $Machine-3)
            (ready $get-3 $Buffer-3)
          )
          (enabled $get-3)
        )
        (when
          (and
            (ready $return-1 $Buffer-1)
            (ready $return-1 $TU)
          )
          (and
            (enabled $return-1)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $get-2 $Buffer-2)
            (ready $get-2 $Machine-2)
          )
          (enabled $get-2)
        )
        (when
          (and
            (ready $return-0 $TU)
          )
          (and
            (enabled $return-0)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $get-1 $Buffer-1)
            (ready $get-1 $Machine-1)
          )
          (enabled $get-1)
        )
        (when
          (and
            (ready $accept $TU)
          )
          (and
            (enabled $accept)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $get-0 $Machine-0)
          )
          (enabled $get-0)
        )
        (when
          (and
            (ready $put-4 $Machine-3)
            (ready $put-4 $Buffer-4)
          )
          (and
            (enabled $put-4)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $put-3 $Buffer-3)
            (ready $put-3 $Machine-2)
          )
          (and
            (enabled $put-3)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $put-2 $Machine-1)
            (ready $put-2 $Buffer-2)
          )
          (and
            (enabled $put-2)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $end $TU)
          )
          (and
            (enabled $end)
            (status uncontrollable)
          )
        )
        (when
          (and
            (ready $put-1 $Buffer-1)
            (ready $put-1 $Machine-0)
          )
          (and
            (enabled $put-1)
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
          (when (enabled $return-4) (inprogress $return-4))
          (when (enabled $return-3) (inprogress $return-3))
          (when (enabled $reject) (inprogress $reject))
          (when (enabled $return-2) (inprogress $return-2))
          (when (enabled $return-1) (inprogress $return-1))
          (when (enabled $return-0) (inprogress $return-0))
          (when (enabled $accept) (inprogress $accept))
          (when (enabled $put-4) (inprogress $put-4))
          (when (enabled $put-3) (inprogress $put-3))
          (when (enabled $end) (inprogress $end))
          (when (enabled $put-2) (inprogress $put-2))
          (when (enabled $put-1) (inprogress $put-1))
        )
      )
  )
  
  (:action default
    :precondition
      (and
        (not (status setup))
        (status busy)
        (not (inprogress $return-4))
        (not (inprogress $return-3))
        (not (inprogress $reject))
        (not (inprogress $return-2))
        (not (inprogress $return-1))
        (not (inprogress $return-0))
        (not (inprogress $accept))
        (not (inprogress $put-4))
        (not (inprogress $put-3))
        (not (inprogress $end))
        (not (inprogress $put-2))
        (not (inprogress $put-1))
      )
    :effect
      (and
        (inprogress $return-4)
        (inprogress $return-3)
        (inprogress $reject)
        (inprogress $return-2)
        (inprogress $return-1)
        (inprogress $return-0)
        (inprogress $accept)
        (inprogress $put-4)
        (inprogress $put-3)
        (inprogress $end)
        (inprogress $put-2)
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
        (when (at $0 $Machine-3) (marked $0 $Machine-3))
        (when (at $1 $Machine-3) (marked $1 $Machine-3))
        (when (at $2 $Machine-3) (marked $2 $Machine-3))
        (when (at $-1 $Buffer-1) (marked $-1 $Buffer-1))
        (when (at $0 $Buffer-1) (marked $0 $Buffer-1))
        (when (at $1 $Buffer-1) (marked $1 $Buffer-1))
        (when (at $2 $Buffer-1) (marked $2 $Buffer-1))
        (when (at $0 $Machine-0) (marked $0 $Machine-0))
        (when (at $1 $Machine-0) (marked $1 $Machine-0))
        (when (at $2 $Machine-0) (marked $2 $Machine-0))
        (when (at $0 $Machine-1) (marked $0 $Machine-1))
        (when (at $1 $Machine-1) (marked $1 $Machine-1))
        (when (at $2 $Machine-1) (marked $2 $Machine-1))
        (when (at $-1 $Buffer-2) (marked $-1 $Buffer-2))
        (when (at $0 $Buffer-2) (marked $0 $Buffer-2))
        (when (at $1 $Buffer-2) (marked $1 $Buffer-2))
        (when (at $2 $Buffer-2) (marked $2 $Buffer-2))
        (when (at $0 $TU) (marked $0 $TU))
        (when (at $1 $TU) (marked $1 $TU))
        (when (at $2 $TU) (marked $2 $TU))
        (when (at $3 $TU) (marked $3 $TU))
        (when (at $-1 $Buffer-3) (marked $-1 $Buffer-3))
        (when (at $0 $Buffer-3) (marked $0 $Buffer-3))
        (when (at $1 $Buffer-3) (marked $1 $Buffer-3))
        (when (at $2 $Buffer-3) (marked $2 $Buffer-3))
        (when (at $0 $Machine-2) (marked $0 $Machine-2))
        (when (at $1 $Machine-2) (marked $1 $Machine-2))
        (when (at $2 $Machine-2) (marked $2 $Machine-2))
        (when (at $-1 $Buffer-4) (marked $-1 $Buffer-4))
        (when (at $0 $Buffer-4) (marked $0 $Buffer-4))
        (when (at $1 $Buffer-4) (marked $1 $Buffer-4))
        (when (at $2 $Buffer-4) (marked $2 $Buffer-4))
      )
  )
  
  (:action do$return-4
    :precondition
      (and
        (status busy)
        (inprogress $return-4)
        (enabled $return-4)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-4)
          (and (not (at $0 $Buffer-4)) (at $1 $Buffer-4))
        )
        (when (at $1 $Buffer-4)
          (and (not (at $1 $Buffer-4)) (at $2 $Buffer-4))
        )
        (when (at $2 $Buffer-4)
          (and (not (at $2 $Buffer-4)) (at $-1 $Buffer-4))
        )
      )
  )
  
  (:action do$return-3
    :precondition
      (and
        (status busy)
        (inprogress $return-3)
        (enabled $return-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-3)
          (and (not (at $0 $Buffer-3)) (at $1 $Buffer-3))
        )
        (when (at $1 $Buffer-3)
          (and (not (at $1 $Buffer-3)) (at $2 $Buffer-3))
        )
        (when (at $2 $Buffer-3)
          (and (not (at $2 $Buffer-3)) (at $-1 $Buffer-3))
        )
      )
  )
  
  (:action do$return-2
    :precondition
      (and
        (status busy)
        (inprogress $return-2)
        (enabled $return-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-2)
          (and (not (at $0 $Buffer-2)) (at $1 $Buffer-2))
        )
        (when (at $1 $Buffer-2)
          (and (not (at $1 $Buffer-2)) (at $2 $Buffer-2))
        )
        (when (at $2 $Buffer-2)
          (and (not (at $2 $Buffer-2)) (at $-1 $Buffer-2))
        )
      )
  )
  
  (:action do$reject
    :precondition
      (and
        (status busy)
        (inprogress $reject)
        (enabled $reject)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $3 $TU)
          (and (not (at $3 $TU)) (at $2 $TU))
        )
      )
  )
  
  (:action do$get-4
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $get-4)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $TU)
          (and (not (at $0 $TU)) (at $1 $TU))
        )
        (when (at $0 $Buffer-4)
          (and (not (at $0 $Buffer-4)) (at $-1 $Buffer-4))
        )
        (when (at $1 $Buffer-4)
          (and (not (at $1 $Buffer-4)) (at $0 $Buffer-4))
        )
        (when (at $2 $Buffer-4)
          (and (not (at $2 $Buffer-4)) (at $1 $Buffer-4))
        )
      )
  )
  
  (:action do$get-3
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $get-3)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $Machine-3)
          (and (not (at $0 $Machine-3)) (at $1 $Machine-3))
        )
        (when (at $1 $Machine-3)
          (and (not (at $1 $Machine-3)) (at $2 $Machine-3))
        )
        (when (at $0 $Buffer-3)
          (and (not (at $0 $Buffer-3)) (at $-1 $Buffer-3))
        )
        (when (at $1 $Buffer-3)
          (and (not (at $1 $Buffer-3)) (at $0 $Buffer-3))
        )
        (when (at $2 $Buffer-3)
          (and (not (at $2 $Buffer-3)) (at $1 $Buffer-3))
        )
      )
  )
  
  (:action do$return-1
    :precondition
      (and
        (status busy)
        (inprogress $return-1)
        (enabled $return-1)
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
          (and (not (at $1 $TU)) (at $3 $TU))
        )
      )
  )
  
  (:action do$get-2
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $get-2)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $Buffer-2)
          (and (not (at $0 $Buffer-2)) (at $-1 $Buffer-2))
        )
        (when (at $1 $Buffer-2)
          (and (not (at $1 $Buffer-2)) (at $0 $Buffer-2))
        )
        (when (at $2 $Buffer-2)
          (and (not (at $2 $Buffer-2)) (at $1 $Buffer-2))
        )
        (when (at $0 $Machine-2)
          (and (not (at $0 $Machine-2)) (at $1 $Machine-2))
        )
        (when (at $1 $Machine-2)
          (and (not (at $1 $Machine-2)) (at $2 $Machine-2))
        )
      )
  )
  
  (:action do$return-0
    :precondition
      (and
        (status busy)
        (inprogress $return-0)
        (enabled $return-0)
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
        (status idle)
        (not (status uncontrollable))
        (enabled $get-1)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $Buffer-1)
          (and (not (at $0 $Buffer-1)) (at $-1 $Buffer-1))
        )
        (when (at $1 $Buffer-1)
          (and (not (at $1 $Buffer-1)) (at $0 $Buffer-1))
        )
        (when (at $2 $Buffer-1)
          (and (not (at $2 $Buffer-1)) (at $1 $Buffer-1))
        )
        (when (at $0 $Machine-1)
          (and (not (at $0 $Machine-1)) (at $1 $Machine-1))
        )
        (when (at $1 $Machine-1)
          (and (not (at $1 $Machine-1)) (at $2 $Machine-1))
        )
      )
  )
  
  (:action do$accept
    :precondition
      (and
        (status busy)
        (inprogress $accept)
        (enabled $accept)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $TU)
          (and (not (at $1 $TU)) (at $2 $TU))
        )
      )
  )
  
  (:action do$get-0
    :precondition
      (and
        (status idle)
        (not (status uncontrollable))
        (enabled $get-0)
      )
    :effect
      (and
        (status event)
        (not (status idle))
        (when (at $0 $Machine-0)
          (and (not (at $0 $Machine-0)) (at $1 $Machine-0))
        )
        (when (at $1 $Machine-0)
          (and (not (at $1 $Machine-0)) (at $2 $Machine-0))
        )
      )
  )
  
  (:action do$put-4
    :precondition
      (and
        (status busy)
        (inprogress $put-4)
        (enabled $put-4)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Machine-3)
          (and (not (at $1 $Machine-3)) (at $0 $Machine-3))
        )
        (when (at $2 $Machine-3)
          (and (not (at $2 $Machine-3)) (at $1 $Machine-3))
        )
        (when (at $0 $Buffer-4)
          (and (not (at $0 $Buffer-4)) (at $1 $Buffer-4))
        )
        (when (at $1 $Buffer-4)
          (and (not (at $1 $Buffer-4)) (at $2 $Buffer-4))
        )
        (when (at $2 $Buffer-4)
          (and (not (at $2 $Buffer-4)) (at $-1 $Buffer-4))
        )
      )
  )
  
  (:action do$put-3
    :precondition
      (and
        (status busy)
        (inprogress $put-3)
        (enabled $put-3)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $0 $Buffer-3)
          (and (not (at $0 $Buffer-3)) (at $1 $Buffer-3))
        )
        (when (at $1 $Buffer-3)
          (and (not (at $1 $Buffer-3)) (at $2 $Buffer-3))
        )
        (when (at $2 $Buffer-3)
          (and (not (at $2 $Buffer-3)) (at $-1 $Buffer-3))
        )
        (when (at $1 $Machine-2)
          (and (not (at $1 $Machine-2)) (at $0 $Machine-2))
        )
        (when (at $2 $Machine-2)
          (and (not (at $2 $Machine-2)) (at $1 $Machine-2))
        )
      )
  )
  
  (:action do$put-2
    :precondition
      (and
        (status busy)
        (inprogress $put-2)
        (enabled $put-2)
      )
    :effect
      (and
        (status event)
        (not (status busy))
        (when (at $1 $Machine-1)
          (and (not (at $1 $Machine-1)) (at $0 $Machine-1))
        )
        (when (at $2 $Machine-1)
          (and (not (at $2 $Machine-1)) (at $1 $Machine-1))
        )
        (when (at $0 $Buffer-2)
          (and (not (at $0 $Buffer-2)) (at $1 $Buffer-2))
        )
        (when (at $1 $Buffer-2)
          (and (not (at $1 $Buffer-2)) (at $2 $Buffer-2))
        )
        (when (at $2 $Buffer-2)
          (and (not (at $2 $Buffer-2)) (at $-1 $Buffer-2))
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
        (when (at $2 $TU)
          (and (not (at $2 $TU)) (at $0 $TU))
        )
      )
  )
  
  (:action do$put-1
    :precondition
      (and
        (status busy)
        (inprogress $put-1)
        (enabled $put-1)
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

