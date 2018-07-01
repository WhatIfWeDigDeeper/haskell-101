// fsi test.fs
// exit 0;;

// pipe
"Hello" |> Seq.length |> (+) 9;;

Seq.head "Hello";;

// tuple, get second
(1, "hello") |> snd;;
