# GameVoice 错误修复脚本
# 用于快速检查和修复项目中的常见问题

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GameVoice 错误修复脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查Node.js版本
Write-Host "1. 检查Node.js版本..." -ForegroundColor Yellow
$nodeVersion = node --version
Write-Host "   Node.js版本: $nodeVersion" -ForegroundColor Green

if ($nodeVersion -match "v(\d+)\.") {
    $majorVersion = [int]$matches[1]
    if ($majorVersion -lt 18) {
        Write-Host "   ⚠️  警告: Node.js版本过低,建议使用18.0.0或更高版本" -ForegroundColor Red
    } else {
        Write-Host "   ✓ Node.js版本符合要求" -ForegroundColor Green
    }
}
Write-Host ""

# 检查npm版本
Write-Host "2. 检查npm版本..." -ForegroundColor Yellow
$npmVersion = npm --version
Write-Host "   npm版本: $npmVersion" -ForegroundColor Green
Write-Host ""

# 检查关键文件是否存在
Write-Host "3. 检查关键文件..." -ForegroundColor Yellow

$criticalFiles = @(
    "Client/package.json",
    "Client/tsconfig.json",
    "Client/vite.config.ts",
    "Client/renderer/src/main.ts",
    "Client/renderer/src/App.vue",
    "Client/renderer/src/i18n/index.ts",
    "Client/renderer/src/i18n/locales/zh-CN.json",
    "Client/renderer/src/i18n/locales/zh-TW.json",
    "Client/renderer/src/i18n/locales/en-US.json",
    "Client/app/main.ts",
    "Client/app/preload.ts"
)

$missingFiles = @()
foreach ($file in $criticalFiles) {
    if (Test-Path $file) {
        Write-Host "   ✓ $file" -ForegroundColor Green
    } else {
        Write-Host "   ✗ $file (缺失)" -ForegroundColor Red
        $missingFiles += $file
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Host ""
    Write-Host "   ⚠️  发现 $($missingFiles.Count) 个缺失文件!" -ForegroundColor Red
    Write-Host "   请检查这些文件是否被意外删除" -ForegroundColor Red
} else {
    Write-Host "   ✓ 所有关键文件都存在" -ForegroundColor Green
}
Write-Host ""

# 检查依赖是否安装
Write-Host "4. 检查依赖安装..." -ForegroundColor Yellow
if (Test-Path "Client/node_modules") {
    Write-Host "   ✓ node_modules目录存在" -ForegroundColor Green
    
    # 检查关键依赖
    $keyDeps = @("vue", "pinia", "electron", "vite", "typescript")
    foreach ($dep in $keyDeps) {
        if (Test-Path "Client/node_modules/$dep") {
            Write-Host "   ✓ $dep 已安装" -ForegroundColor Green
        } else {
            Write-Host "   ✗ $dep 未安装" -ForegroundColor Red
        }
    }
} else {
    Write-Host "   ✗ node_modules目录不存在" -ForegroundColor Red
    Write-Host "   需要运行: cd Client && npm install" -ForegroundColor Yellow
}
Write-Host ""

# 提供修复建议
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  修复建议" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if ($missingFiles.Count -gt 0) {
    Write-Host "1. 恢复缺失的文件" -ForegroundColor Yellow
    Write-Host "   - 从备份或版本控制恢复文件" -ForegroundColor White
    Write-Host "   - 或重新创建这些文件" -ForegroundColor White
    Write-Host ""
}

if (-not (Test-Path "Client/node_modules")) {
    Write-Host "2. 安装依赖" -ForegroundColor Yellow
    Write-Host "   cd Client" -ForegroundColor White
    Write-Host "   npm install" -ForegroundColor White
    Write-Host ""
}

Write-Host "3. 运行类型检查" -ForegroundColor Yellow
Write-Host "   cd Client" -ForegroundColor White
Write-Host "   npm run typecheck" -ForegroundColor White
Write-Host ""

Write-Host "4. 运行代码检查" -ForegroundColor Yellow
Write-Host "   cd Client" -ForegroundColor White
Write-Host "   npm run lint" -ForegroundColor White
Write-Host ""

Write-Host "5. 启动开发服务器" -ForegroundColor Yellow
Write-Host "   cd Client" -ForegroundColor White
Write-Host "   npm run dev" -ForegroundColor White
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  快速修复命令" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "如果要自动执行修复,请运行:" -ForegroundColor Yellow
Write-Host ""
Write-Host "# 安装依赖" -ForegroundColor White
Write-Host "cd Client && npm install" -ForegroundColor Cyan
Write-Host ""
Write-Host "# 修复代码格式" -ForegroundColor White
Write-Host "cd Client && npm run lint:fix" -ForegroundColor Cyan
Write-Host ""
Write-Host "# 格式化代码" -ForegroundColor White
Write-Host "cd Client && npm run format" -ForegroundColor Cyan
Write-Host ""
Write-Host "# 启动应用" -ForegroundColor White
Write-Host "cd Client && npm run dev" -ForegroundColor Cyan
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  检查完成" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 询问是否要自动安装依赖
$response = Read-Host "是否要自动安装依赖? (y/n)"
if ($response -eq "y" -or $response -eq "Y") {
    Write-Host ""
    Write-Host "正在安装依赖..." -ForegroundColor Yellow
    Set-Location Client
    npm install
    Set-Location ..
    Write-Host ""
    Write-Host "✓ 依赖安装完成!" -ForegroundColor Green
}

Write-Host ""
Write-Host "脚本执行完成!" -ForegroundColor Green
Write-Host "请查看上面的输出了解详细信息" -ForegroundColor White
Write-Host ""
