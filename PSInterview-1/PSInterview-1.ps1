#
# PSInterview-1.ps1
#

<#
"isPalindrome" 
"Is it a palindrome ignoring punctuation and case." 
isPalindrome "A man, $a plan, $a canal: panama!" -eq $true 
#>
function isPalindrome([string] $word)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"

    foreach ($c in $word)
    {
        if (char.IsLetterOrDigit($c)
            $sb.Append(char.ToLower($c))
    }
            
    for ($i = 0; $i -lt $sb.Length / 2; $i++)
        if (sb[$i] -ne sb[sb.Length - 1 - i])
            return $false

    return $true
}

<#
    "isPalindrome" 
    "Is it a palindrome ignoring punctuation and case." 
    isPalindrome "A man, $a plan, $a canal: panama!" -eq $true 
    #>
function isPalindrome2([string] $word)
{
    for($i = 0,$j = $word.Length - 1; $i -lt $j $i++,$j--)
    {
        while (!char.IsLetterOrDigit($word[$i]) -and $i -lt $word.Length){ $i++ }
        while (!char.IsLetterOrDigit($word[$j]) -and $j -ge 0){ $j-- }

        if (Char.ToLower($word[$i]) -ne Char.ToLower($word[$j]){
            return $false
			}
    }

    return $true
}
<#
"isPalindrome" 
"Is it a palindrome ignoring punctuation and case." 
isPalindromeLinq "A man, $a plan, $a canal: panama!" -eq $true 
Use Linq. Do not use loops.
#>
function isPalindromeLinq([string] $word)
{
    [char[]] $chars = $word.ToLower().Trim()
            .Where(c => Char.IsLetterOrDigit($c)
            .ToArray()

    return chars#.SequenceEqual(chars.Reverse()
}

<#
"$countLetters" 
"Count times each letter appears in string" 
$countLetters "The quick brown fox jumped over the lazy dogs." )
#>
function countLetters([string] sentence)
{
    Dictionary<char, int> $counts  =  Dictionary<char, int>()

    foreach (ch in sentence)
    {
        if (char.IsLetterOrDigit(ch)
        {
            [char] $c = char.ToLower(ch)

            if ($counts.ContainsKey($c){
                $counts[$c]++
				}
            else{
                $counts.Add($c, 1)
				}
        }
    }

    $sb = New-Object -TypeName "System.Text.StringBuilder"

    $list = $counts.Keys.ToList()
    $list.Sort()

    foreach ($key in $list){
        $sb.AppendLine($key + " : " + $counts[$key])
		}
    return $sb.ToString()
}

<#
"$countWords" 
"Count times each word appears in string" 
$countWords "This is fun and this is easy" )
#>
function countWords([string] sentence)
{
    Dictionary<string, int> $counts = Dictionary<string, int>()
    [string[]] $rawlist = sentence.ToLower().Trim().Split()
    <#
    $rawlist = sentence
                    .ToLower().Trim().Split()
                    .Select($word => $word.Trim()
                    .Where($word => !string.IsNullOrEmpty($word)
    #>
    foreach ($word in $rawlist)
    {
        if ($counts.ContainsKey($word)
            $counts[$word]++
        else
            $counts.Add($word, 1)
    }

    $sb = New-Object -TypeName "System.Text.StringBuilder"

    $list = $counts.Keys.ToList()
    $list.Sort()

    foreach ($key in $list){
        $sb.AppendLine($key + " : " + $counts[$key])
		}

    return $sb.ToString()

}

#main
"isPalindrome" 
isPalindrome "A man, a plan, a canal: Panama!" -eq $true 

"isPalindrome2" 
isPalindrome2 "A man, a plan, a canal: Panama!" -eq $true 

"isPalindromeLinq" 
isPalindromeLinq "A man, a plan, a canal: Panama!" -eq $true 

"countLetters" 
countLetters "The quick brown fox jumped over the lazy dogs." 

"countWords" 
countWords "This is fun and this is easy" 
