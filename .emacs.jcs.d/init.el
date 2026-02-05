;;; init.el --- Your own configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq user-full-name "Jen-Chieh Shen"
      user-mail-address "jcs090218@gmail.com")

;;
;;; Mail

(use-package message
  :config
  (setq message-send-mail-function #'smtpmail-send-it)

  (setq send-mail-function #'smtpmail-send-it
        smtpmail-smtp-user user-mail-address
        smtpmail-default-smtp-server "smtp.gmail.com"
        ;; 456 for SSL / 587 for TLS
        smtpmail-smtp-service 587))

;;; init.el ends here
