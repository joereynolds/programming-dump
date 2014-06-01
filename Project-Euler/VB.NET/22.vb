'Using names.txt (right click and 'Save Link/Target As...'), 
'a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
'Then working out the alphabetical value for each name, 
'multiply this value by its alphabetical position in the list to obtain a name score.

'For example, 
'when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, 
'is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
'What is the total of all the name scores in the file?



Imports System
Imports System.IO


Module Module1

    Sub Main()

        Using sr As New StreamReader("names.txt")
            Dim letterSum As Long = 0
            Dim wordIndex As Long = 0
            Dim total As Long = 0
            Dim line As String
            line = sr.ReadToEnd()
            Dim splitted As String() = line.Split(New Char() {","})
            Array.Sort(splitted)

            For i As Integer = 0 To splitted.Length - 1
                splitted(i) = splitted(i).Trim("""")
                For Each letter As Char In splitted(i)
                    letterSum += Asc(letter) - 64
                Next
                wordIndex = Array.IndexOf(splitted, splitted(i)) + 1
                total += letterSum * wordIndex
                letterSum = 0
            Next
        End Using

    End Sub

End Module
