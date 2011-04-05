;;; Copyright (C) 2010 Rocky Bernstein <rocky@gnu.org>
(require 'load-relative)
(require-relative-list
 '("../../common/send") "dbgr-")

(declare-function dbgr-terminate &optional arg)
(declare-function dbgr-define-gdb-like-commands())

(defun dbgr-define-trepan-commands ()
  "(Re)define a bunch of trepan commands have"
  ;; trepan doesn't allow for the more general file:line breakpoint yet.
  (dbgr-define-gdb-like-commands)
)

(provide-me "dbgr-trepan-")
