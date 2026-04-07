<div align="center">

# ⚖️ Vibe-Lawyering 💻 + 企查查MCP增强版

[![MCP](https://img.shields.io/badge/MCP-Compatible-green)](https://github.com/modelcontextprotocol)
[![QCC](https://img.shields.io/badge/企查查-数据底座-blue)](https://www.qcc.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> 基于 [LawMotion AI Vibe-Lawyering](https://github.com/LawMotion-AI/Vibe-Lawyering) 法律人AI工具箱，
> **零代码改动**集成企查查MCP服务，为法律人提供智能化的中国企业尽职调查、合同审查、法律研究解决方案。

**原仓库版本**: Vibe-Lawyering v1.0.0 with 3 agent skills (法律尽职调查、合同审查、法律研究)

[快速开始](#快速开始) · [使用场景](#典型应用场景) · [技能列表](#包含的skill) · [配置说明](#配置企查查mcp)

</div>

---

## 🎯 核心价值

```
+------------------------------------------------------------------+
|                                                                  |
|     Original Legal Skills + QCC MCP (China Data Foundation)     |
|                                                                  |
|     +----------------------+      MCP       +------------------+ |
|     | legal-due-diligence  |  ◄──────────►  | qcc-company      | |
|     | contract-review      |    Auto-Route  | qcc-risk         | |
|     | legal-research       |                | qcc-ipr          | |
|     |                      |                | qcc-operation    | |
|     +----------------------+                +------------------+ |
|                                                                  |
|     ✅ Zero Code Change: Use original skills as-is               |
|     ✅ Plug & Play: Config MCP to auto-connect QCC data          |
|     ✅ Smart Enhancement: DD/Contract Review auto-fetch data     |
|                                                                  |
+------------------------------------------------------------------+
```

---

## 🚀 快速开始

### 1. 克隆本仓库

```bash
git clone https://github.com/your-org/vibe-lawyering-qcc.git
cd vibe-lawyering-qcc
```

### 2. 配置企查查MCP

```bash
# 设置环境变量
export QCC_MCP_API_KEY="your_api_key_here"

# 验证配置
source ./scripts/setup-qcc-env.sh
```

从 [企查查智能体数据平台](https://agent.qcc.com) 申请API Key。

### 3. 启动Claude Code

```bash
claude --plugin-dir .
```

### 4. 体验增强SKILL

| 场景 | Command | 企查查增强 |
|------|---------|-----------|
| 法律尽职调查 | `/legal-dd-qcc 企查查科技` | ✅ 自动获取工商、股权、风险、知产数据 |
| 合同审查 | `/contract-review-qcc 合同.docx --party XX公司` | ✅ 交易对手风险核查 |
| 法律研究 | `/legal-research-qcc` | ✅ 关联企业案例检索 |

---

## 📦 与原仓库的关系

| 项目 | 说明 |
|------|------|
| **原仓库** | [LawMotion-AI/Vibe-Lawyering](https://github.com/LawMotion-AI/Vibe-Lawyering) |
| **本仓库原则** | **零侵入**：不修改任何原作者SKILL代码 |
| **增强方式** | 仅通过 `.mcp.json` 配置企查查MCP服务 |
| **同步更新** | 可直接同步上游仓库更新，无代码冲突 |

---

## 🎬 典型应用场景

### 场景1：法律尽职调查（企查查自动数据获取）

**使用Command**: `/legal-dd-qcc 企查查科技股份有限公司`

```
📝 用户输入：
"请对企查查科技股份有限公司进行法律尽职调查"

⚡ 自动执行：
├── SKILL：legal-due-diligence-qcc 启动尽调流程
├── 企查查MCP自动匹配调用：
│   ├── qcc-company: 工商登记信息核验
│   ├── qcc-company: 股权穿透识别受益所有人
│   ├── qcc-risk: 18类风险信号扫描（失信、被执行、诉讼等）
│   ├── qcc-ipr: 知识产权资产盘点
│   └── qcc-operation: 经营动态与资质证书
└── 生成标准化尽调底稿（含企查查数据）

📄 输出结果：
    【企查查数据核验 - 第1章 主体资格】
    ✅ 企业名称：企查查科技股份有限公司
    ✅ 统一社会信用代码：91320XXXXXXXXXXXX
    ✅ 注册资本：10000万人民币（实缴）
    ✅ 成立日期：2014-XX-XX
    ✅ 法定代表人：XXX
    ✅ 经营状态：存续（在营）

    【企查查数据核验 - 第2章 股权结构】
    ✅ 控股股东：XXX（35%）
    ✅ 股权穿透：识别受益所有人2名
    ✅ 历史变更：共X条变更记录

    【企查查数据核验 - 第9章 诉讼仲裁】
    ⚠️ 司法诉讼：共X条（作为被告X条）
    ✅ 无失信记录
    ✅ 无被执行记录
```

### 场景2：合同审查 + 交易对手风险核查

**使用Command**: `/contract-review-qcc 采购合同.docx --party 北京XX科技有限公司`

```
📝 用户输入：
"请审查这份采购合同，对方是北京XX科技有限公司"

⚡ 自动执行：
├── SKILL：contract-review-qcc 启动合同审核
├── 企查查MCP增强：
│   ├── qcc-company: 查询对方企业工商信息
│   ├── qcc-risk: 扫描风险信号
│   │   ├── 被执行：2条（金额50万）⚠️
│   │   └── 司法诉讼：5件（作为被告4件）⚠️
│   └── qcc-operation: 查询经营状态
├── 合同条款审查
└── 生成修订批注版docx + 交易对手风险报告

📄 输出结果：
    【交易对手风险报告 - 北京XX科技有限公司】
    ⚠️ 被执行记录：2条
    ⚠️ 司法诉讼：5件（作为被告4件）
    风险等级：中等风险

    【合同审查 - 交易对手风险批注】
    问题：交易对手存在被执行记录
    风险：可能影响合同履约能力
    修改建议：建议增加履约保证金条款
```

---

## 📚 包含的SKILL

| 分类 | SKILL | 功能描述 | 企查查MCP增强 |
|------|-------|----------|---------------|
| **尽调** | `legal-due-diligence-qcc` | 法律尽职调查 | ✅ **10章自动数据填充** |
| **合同** | `contract-review-qcc` | 合同审查 | ✅ **交易对手风险核查** |
| **研究** | `legal-research-qcc` | 法律研究 | ✅ **关联企业案例检索** |

---

## ⚙️ 配置企查查MCP

### MCP服务说明

| 服务 | 说明 | 适用场景 |
|------|------|----------|
| `qcc-company` | 企业基座 - 工商登记、股东信息 | 尽调第1-3章、合同审查 |
| `qcc-risk` | 风控大脑 - 18类风险信号 | 尽调第8-9章、合同审查 |
| `qcc-ipr` | 知产引擎 - 专利商标软著 | 尽调第4章 |
| `qcc-operation` | 经营罗盘 - 招投标资质 | 尽调第4-5章 |

### 环境变量配置

```bash
# ~/.zshrc 或 ~/.bash_profile
export QCC_MCP_API_KEY="your_api_key_here"
```

### 验证配置

```bash
source ./scripts/setup-qcc-env.sh
```

---

## 🛡️ 安全与合规

- **数据安全**：企查查MCP采用HTTPS加密传输，API Key通过环境变量管理
- **代码安全**：零代码改动，保持原作者SKILL的原生安全性
- **授权访问**：需要有效的企查查智能体数据平台账号和API Key
- **合规使用**：遵守《个人信息保护法》《数据安全法》《律师法》等相关法规
- **审计追溯**：所有MCP调用可追溯，支持合规审计

---

## 📖 文档索引

| 文档 | 说明 |
|------|------|
| `skills/legal-due-diligence-qcc/SKILL.md` | 尽调SKILL详细说明 |
| `skills/contract-review-qcc/SKILL.md` | 合同审查SKILL详细说明 |
| `commands/legal-dd-qcc.md` | 尽调查Command使用说明 |
| `commands/contract-review-qcc.md` | 合同审查Command使用说明 |
| `scripts/setup-qcc-env.sh` | 环境变量配置脚本 |

---

## 🤝 致谢

- 本仓库基于 [Vibe-Lawyering](https://github.com/LawMotion-AI/Vibe-Lawyering) 构建
- 感谢 LawMotion AI 提供的专业法律SKILL
- 企查查智能体数据平台：https://agent.qcc.com

---

## 📄 许可证

与原仓库保持一致：[MIT License](LICENSE)

---

<div align="center">

**用 AI + 企查查数据 赋能法律人**

⭐ 如果这个项目对你有帮助，请给我们一个 Star！

</div>

---

## 💡 使用提示

> **重要**：本插件的SKILL代码完全来自原作者，未做任何修改。企查查MCP的调用是通过 **Claude Code的智能工具匹配机制** 自动完成的——当SKILL需要"企业信息查询"时，系统会自动匹配到配置的 `qcc-company` 等MCP服务。
>
> 这种"配置驱动"的架构让您可以：
> - ✅ **零代码改动**使用专业法律SKILL
> - ✅ **灵活切换数据源**（企查查 / 其他数据源）
> - ✅ **保持与上游仓库同步更新**，无代码冲突
