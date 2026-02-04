;;; init.el --- Your own configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq user-full-name "Jen-Chieh Shen"
      user-mail-address "jcs090218@gmail.com")

;;
;;; Mail

(setq message-send-mail-function #'smtpmail-send-it)

(setq send-mail-function #'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)  ; 456 for SSL / 587 for TLS

;;; init.el ends here
