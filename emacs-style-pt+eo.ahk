CapsLock::Ctrl

F13::WinActivate, ahk_exe firefox.exe
^#u::WinActivate, ahk_exe firefox.exe

F14::WinActivate, ahk_exe thunderbird.exe
^#i::WinActivate, ahk_exe thunderbird.exe

F15::WinActivate, ahk_exe Slack.exe
^#o::WinActivate, ahk_exe Slack.exe

F17::WinActivate, ahk_exe emacs.exe
^#j::WinActivate, ahk_exe emacs.exe

F18::WinActivate, ahk_exe sbcl.exe
^#k::WinActivate, ahk_exe sbcl.exe

F19::WinActivate, ahk_exe chrome.exe
^#l::WinActivate, ahk_exe chrome.exe

F21::^`
^#m::^`


#InstallKeybdHook

prefixMaybe(ByRef map) {
        SendLevel 1
        ; Read 1 key (L1), Case-Sensitive (C), Ignore backspace (B)
        ; Ignore other hotkeys (I), TImeout after 0.5 seconds (T0.5)
        Input, userKey, L1 C B I T0.5 M, {LControl}{RControl}{LAlt}{RAlt}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}

        ; If failed send the "end key" concealed in ErrorLevel
        if (StrLen(userKey) <= 0)
        {
                bycolon := StrSplit(ErrorLevel,":")
                SendInput % "{" . bycolon[2] . "}"
                return
        }

        if userKey is lower
        {
                key := userKey
        } else {
                key := "u" . userKey
        }

        probe := map[key]
        if (StrLen(probe) > 0)
        {
                SendInput {Backspace}
                SendInput % probe
        } else {
                SendInput % userKey
        }
}

dontPrefix() {
        WinGetClass, class, A
        if (class = "Emacs") {
                return 1
        } else { 
                return 0
        }
}

~'::
var := dontPrefix()
if (var > 0) {
        return
}
acuteChars := {a: "á", uA: "Á", e: "é", uE: "É", i: "í", uI: "Í", o: "ó", uO: "Ó", u: "ú", uU: "Ú"}
prefixMaybe(acuteChars)
return

~`::
var := dontPrefix()
if (var > 0) {
        return
}
graveChars := {a: "à", uA: "À", "e": "è", uE: "È", i: "ì", uI: "Ì", o: "ò", uO: "Ò", u: "ù", uU: "Ù"}
prefixMaybe(graveChars)
return

~~::
var := dontPrefix()
if (var > 0) {
        return
}
tildeChars := {a: "ã", uA: "Ã", o: "õ", uO: "Õ", "u<": "«", "u>": "»"}
prefixMaybe(tildeChars)
return

~^::
var := dontPrefix()
if (var > 0) {
        return
}
circumflexChars := {a: "â", uA: "Â", e: "ê", uE: "Ê", i: "î", uI: "Î", o: "ô", uO: "Ô", h: "ĥ", uH: "Ĥ", g: "ĝ", uG: "Ĝ", s: "ŝ", uS: "Ŝ", c: "ĉ", uC: "Ĉ", j: "ĵ", uJ: "Ĵ", u: "ŭ", uU: "Ŭ"}
prefixMaybe(circumflexChars)
return

~,::
var := dontPrefix()
if (var > 0) {
        return
}
cedillaKeys := {c: "ç", uC: "Ç", o: "º", a: "ª", e: "€"}
prefixMaybe(cedillaKeys)
return
