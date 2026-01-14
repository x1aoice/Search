Add-Type -AssemblyName System.Drawing

$filename = "d:\Project\Search\extension\icon.png"
$size = 128
$bmp = New-Object System.Drawing.Bitmap $size, $size
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# 透明背景
$g.Clear([System.Drawing.Color]::Transparent)

# 黑色画笔，宽度12
$pen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 30, 30, 30), 12)

# 画圆圈 (放大镜主体)
$g.DrawEllipse($pen, 30, 30, 50, 50)

# 画手柄
$g.DrawLine($pen, 68, 72, 98, 102)

$bmp.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)

$pen.Dispose()
$g.Dispose()
$bmp.Dispose()

Write-Host "Icon generated at $filename"
