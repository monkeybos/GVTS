# GameVoice - 游戏语音实时同声翻译系统

<div align="center">

![GameVoice Logo](https://via.placeholder.com/200x200?text=GameVoice)

**打破语言障碍，让全球玩家无缝沟通**

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.5.4-blue)](https://www.typescriptlang.org/)
[![Electron](https://img.shields.io/badge/Electron-31.3.0-47848F)](https://www.electronjs.org/)
[![Vue](https://img.shields.io/badge/Vue-3.5.5-4FC08D)](https://vuejs.org/)

[English](README_EN.md) | 简体中文

</div>

## 📖 项目简介

GameVoice是一个基于Electron + Vue3 + TypeScript的桌面应用程序，专为游戏玩家提供实时语音同声翻译服务。系统通过虚拟声卡技术捕获游戏内队友的麦克风语音，利用AI大模型进行实时翻译，并通过RVC技术将翻译结果以自然语音的方式反馈给用户。

### ✨ 核心特性

- 🎙️ **实时语音翻译** - 支持10种语言的实时双向翻译
- 🎮 **游戏专用优化** - 支持CS2、瓦罗兰特、PUBG等热门游戏
- 🤖 **多AI引擎支持** - 集成豆包、DeepSeek、Kimi、GPT、讯飞等多个AI引擎
- 📚 **游戏术语库** - 内置150+游戏专业术语，翻译更准确
- 🎵 **RVC音色转换** - 自然的语音合成和音色转换
- 🔒 **隐私保护** - 本地处理，数据加密，不上传隐私信息
- 🌍 **多语言界面** - 支持中文简体/繁体、英文界面
- ⚡ **低延迟** - 端到端延迟≤1000ms，目标480ms

## 🚀 快速开始

### 系统要求

- **操作系统**: Windows 10/11 (64位)
- **处理器**: Intel i5 8代 / AMD Ryzen 5 2600 或更高
- **内存**: 8GB RAM（推荐16GB）
- **网络**: 稳定的互联网连接，带宽≥2Mbps

### 安装步骤

1. **下载应用**
   ```bash
   # 从GitHub Releases下载最新版本
   # 或克隆仓库自行构建
   git clone https://github.com/your-repo/gamevoice.git
   cd gamevoice
   ```

2. **安装依赖**
   ```bash
   npm install
   ```

3. **安装VB-Cable虚拟声卡**
   - 应用会在首次启动时引导您安装
   - 或手动从[官网](https://vb-audio.com/Cable/)下载安装

4. **配置AI引擎**
   - 至少配置一个AI翻译引擎
   - 支持的引擎：豆包、DeepSeek、Kimi、ChatGPT、讯飞星火
   - 需要自行申请API密钥（大部分服务商提供免费额度）

5. **启动应用**
   ```bash
   # 开发模式
   npm run dev

   # 生产构建
   npm run build
   npm start
   ```

## 📚 使用指南

### 基本使用

1. **启动游戏** - 启动支持的游戏（CS2、瓦罗兰特、PUBG等）
2. **选择语言** - 设置队友语言和目标语言
3. **开始翻译** - 点击"开始翻译"按钮
4. **语音交流** - 在游戏中与队友正常语音交流
5. **实时翻译** - 系统自动翻译并播放

### 支持的语言

**队友语言（源语言）**:
- 🇺🇸 英语
- 🇷🇺 俄语
- 🇯🇵 日语
- 🇰🇷 韩语
- 🇪🇸 西班牙语
- 🇫🇷 法语
- 🇩🇪 德语
- 🇮🇹 意大利语
- 🇵🇹 葡萄牙语
- 🇸🇦 阿拉伯语

**我的语言（目标语言）**:
- 🇨🇳 中文（简体）
- 🇹🇼 中文（繁体）

### 支持的游戏

| 游戏 | 进程名 | 术语库 | 状态 |
|------|--------|--------|------|
| 反恐精英2 (CS2) | cs2.exe | ✅ 150个术语 | ✅ 已适配 |
| 瓦罗兰特 (Valorant) | VALORANT.exe | ✅ 120个术语 | ✅ 已适配 |
| 绝地求生 (PUBG) | TslGame.exe | ✅ 100个术语 | ✅ 已适配 |
| Apex英雄 | r5apex.exe | ⏳ 开发中 | ⏳ 开发中 |
| 守望先锋2 | Overwatch.exe | ⏳ 开发中 | ⏳ 开发中 |
| Dota 2 | dota2.exe | ⏳ 开发中 | ⏳ 开发中 |

### 快捷键

- `Ctrl+Shift+T` - 开始/暂停翻译
- `Ctrl+Shift+S` - 打开设置面板
- `Ctrl+Shift+H` - 显示/隐藏窗口
- `ESC` - 返回主面板

## 🛠️ 技术架构

### 技术栈

- **前端框架**: Vue 3.5.5 + TypeScript 5.5.4
- **桌面框架**: Electron 31.3.0
- **构建工具**: Vite 5.4.2
- **状态管理**: Pinia 2.2.6
- **国际化**: vue-i18n
- **测试框架**: Vitest + @vue/test-utils

### 核心技术

- **音频处理**: WASAPI AudioClient3
- **虚拟声卡**: VB-Cable
- **Native开发**: Node-API 8.5.0
- **音色转换**: RVC (Real-time Voice Conversion)
- **数据加密**: AES-256-GCM

### 系统架构

```
┌─────────────────────────────────────────┐
│         GameVoice 应用层                 │
├─────────────────────────────────────────┤
│  渲染进程 (Vue 3 + TypeScript)           │
│  ┌──────────┐  ┌──────────┐  ┌────────┐│
│  │ UI组件   │←→│ 状态管理 │←→│ 服务层 ││
│  └──────────┘  └──────────┘  └────────┘│
│         ↕ IPC通信                        │
├─────────────────────────────────────────┤
│  主进程 (Electron + TypeScript)          │
│  ┌──────────┐  ┌──────────┐  ┌────────┐│
│  │ 窗口管理 │  │ IPC处理  │  │ 系统集成││
│  └──────────┘  └──────────┘  └────────┘│
│         ↕ Node-API                       │
├─────────────────────────────────────────┤
│  Native层 (C/C++)                        │
│  ┌──────────┐  ┌──────────┐  ┌────────┐│
│  │ 音频捕获 │  │ 音频处理 │  │ 驱动管理││
│  └──────────┘  └──────────┘  └────────┘│
└─────────────────────────────────────────┘
```

## 🔧 开发指南

### 项目结构

```
GameVoice/
├── Client/
│   ├── app/                    # Electron主进程
│   │   ├── main.ts            # 主进程入口
│   │   ├── preload.ts         # Preload脚本
│   │   └── services/          # 主进程服务
│   ├── renderer/              # Vue渲染进程
│   │   ├── src/
│   │   │   ├── components/   # Vue组件
│   │   │   ├── stores/       # Pinia状态管理
│   │   │   ├── i18n/         # 国际化
│   │   │   └── App.vue       # 根组件
│   │   └── index.html
│   ├── shared/                # 共享代码
│   │   ├── errors.ts         # 错误定义
│   │   ├── logger.ts         # 日志系统
│   │   └── ...
│   ├── services/              # 业务服务
│   │   ├── audio/            # 音频服务
│   │   ├── translation/      # 翻译服务
│   │   ├── engines/          # AI引擎适配器
│   │   └── game/             # 游戏检测
│   └── native/                # C/C++模块
│       └── audio-capture/    # 音频捕获模块
├── .kiro/
│   └── specs/                 # 项目规格文档
└── tests/                     # 测试文件
```

### 开发命令

```bash
# 安装依赖
npm install

# 开发模式
npm run dev

# 构建应用
npm run build

# 运行测试
npm run test

# 代码检查
npm run lint

# 代码格式化
npm run format

# 构建Native模块
npm run build:native
```

### 代码规范

- 遵循**6A工作流程**: 分析→架构→算法→应用→测试→部署
- 遵循**5S规则**: 整理、整顿、清扫、清洁、素养
- 使用ESLint + Prettier进行代码格式化
- TypeScript严格模式
- 单元测试覆盖率≥90%
- 所有公共API必须有JSDoc注释

## 🤝 贡献指南

我们欢迎所有形式的贡献！

### 如何贡献

1. Fork本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启Pull Request

### 贡献类型

- 🐛 Bug修复
- ✨ 新功能
- 📝 文档改进
- 🎨 UI/UX改进
- 🌍 翻译和国际化
- 🧪 测试用例
- ⚡ 性能优化

## 📄 许可证

本项目采用MIT许可证 - 查看[LICENSE](LICENSE)文件了解详情

## 🙏 致谢

- [Electron](https://www.electronjs.org/) - 跨平台桌面应用框架
- [Vue.js](https://vuejs.org/) - 渐进式JavaScript框架
- [VB-Cable](https://vb-audio.com/Cable/) - 虚拟音频设备驱动
- [RVC](https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI) - 实时语音转换技术
- 所有AI服务提供商（豆包、DeepSeek、Kimi、OpenAI、讯飞）

## 📞 联系我们

- **GitHub Issues**: [提交问题](https://github.com/your-repo/gamevoice/issues)
- **讨论区**: [参与讨论](https://github.com/your-repo/gamevoice/discussions)
- **邮箱**: support@gamevoice.com
- **官网**: https://gamevoice.com

## 🗺️ 路线图

### v1.0.0 (当前开发中)
- ✅ 核心翻译功能
- ✅ 多AI引擎支持
- ✅ 游戏术语库
- ⏳ 性能优化
- ⏳ 完整测试覆盖

### v1.1.0 (计划中)
- ⏳ 更多游戏支持
- ⏳ 更多语言支持
- ⏳ 插件系统
- ⏳ 云同步配置

### v2.0.0 (未来)
- ⏳ 多人语音识别
- ⏳ 实时字幕显示
- ⏳ 语音情感分析
- ⏳ 移动端支持

---

<div align="center">

**如果这个项目对你有帮助，请给我们一个⭐️**

Made with ❤️ by GameVoice Team

</div>
