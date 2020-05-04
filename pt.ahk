#InstallKeybdHook
EndKeys = {LControl}{RControl}{LAlt}{RAlt}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}

graveChars := {a: "à", uA: "À", "e": "è", uE: "È", i: "ì", uI: "Ì", o: "ò", uO: "Ò", u: "ù", uU: "Ù"}
acuteChars := {a: "á", uA: "Á", e: "é", uE: "É", i: "í", uI: "Í", o: "ó", uO: "Ó", u: "ú", uU: "Ú"}
tildeChars := {a: "ã", uA: "Ã", o: "õ", uO: "Õ"}
circumflexChars := {a: "â", uA: "Â", e: "ê", uE: "Ê", i: "î", uI: "Î", o: "ô", uO: "Ô", u: "û", uU: "Û"}

#"::
  Input, userKey, L1 C, %EndKeys%
  if userKey is lower
    key := userKey
  else
    key := "u" . userKey
  Send % graveChars[key]
return

#'::
  Input, userKey, L1 C, %EndKeys%
  if userKey is lower
    key := userKey
  else
    key := "u" . userKey
  Send % acuteChars[key]
return

#\::
  Input, userKey, L1 C, %EndKeys%
  if userKey is lower
    key := userKey
  else
    key := "u" . userKey
  Send % tildeChars[key]
return

#|::
  Input, userKey, L1 C, %EndKeys%
  if userKey is lower
    key := userKey
  else
    key := "u" . userKey
  Send % circumflexChars[key]
return

#;::
  Send ç
return

+#;::
  Send Ç
return
