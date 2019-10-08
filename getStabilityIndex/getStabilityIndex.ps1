#
# The script collects SystemStabilityIndex metrics and calculte average value.
#

$stIndex = @() 

$count = 0

gwmi Win32_ReliabilityStabilityMetrics | Select -exp SystemStabilityIndex | % {$stIndex += $_}

foreach ($index in $stIndex) {
    $count += $index
}

$count = [math]::Round($count/$stIndex.count, 4)

return $count
