# Vibe-Lawyering QCC - Agent Instructions

## 项目概述

Vibe-Lawyering QCC 是基于 Vibe-Lawyering 的企查查 MCP 增强版本。

**核心理念**：
- **零代码改动**：保持原作者 SKILL 代码不变
- **配置驱动**：通过 `.mcp.json` 自动连接企查查数据服务
- **智能增强**：原有 SKILL 自动获得企查查数据能力

## 架构说明

```
┌─────────────────────────────────────────┐
│           Claude Code                   │
│         (Tool Matching)                 │
└──────────────┬──────────────────────────┘
               │
        ┌──────▼──────┐
        │  .mcp.json  │
        │  MCP Config │
        └──────┬──────┘
               │
    ┌──────────┼──────────┐
    │          │          │
┌───▼───┐ ┌───▼───┐ ┌───▼───┐
│qcc-   │ │qcc-   │ │qcc-   │
│company│ │risk   │ │ipr    │
└───┬───┘ └───┬───┘ └───┬───┘
    │         │         │
    └─────────┴─────────┘
              │
         ┌────▼────┐
         │ 企查查   │
         │ 数据平台 │
         └─────────┘
```

## 技能清单

| SKILL | 功能 | 企查查增强 |
|-------|------|-----------|
| legal-due-diligence-qcc | 法律尽职调查 | 10章自动数据填充 |
| contract-review-qcc | 合同审查 | 交易对手风险核查 |
| legal-research-qcc | 法律研究 | 关联企业案例检索 |

## MCP 服务映射

| 服务 | URL | 用途 |
|------|-----|------|
| qcc-company | https://agent.qcc.com/mcp/company/stream | 工商登记、股东信息 |
| qcc-risk | https://agent.qcc.com/mcp/risk/stream | 风险信号（18类） |
| qcc-ipr | https://agent.qcc.com/mcp/ipr/stream | 专利商标软著 |
| qcc-operation | https://agent.qcc.com/mcp/operation/stream | 经营资质、招投标 |

## 环境要求

- Claude Code
- 企查查 MCP API Key
- Python 3.10+ (用于初始化脚本)

## 文件结构

```
vibe-lawyering-qcc/
├── .mcp.json                    # MCP配置
├── .claude-plugin/
│   └── plugin.json              # 插件清单
├── skills/
│   ├── legal-due-diligence-qcc/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   └── scripts/
│   ├── contract-review-qcc/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   └── scripts/
│   └── legal-research-qcc/
│       └── SKILL.md
├── commands/
│   ├── legal-dd-qcc.md
│   └── contract-review-qcc.md
├── scripts/
│   └── setup-qcc-env.sh
├── README.md
├── CLAUDE.md
└── LICENSE
```

## 开发规范

### SKILL 文件规范
- 使用 YAML frontmatter
- 必需字段：name, description
- 可选字段：metadata (author, version, standard)
- description 使用 `>` 折叠换行

### Command 文件规范
- 使用 YAML frontmatter
- 必需字段：name, description
- 可选字段：argument-hint

### MCP 调用原则
- 当识别到企业名称时自动调用
- 数据作为底稿/报告的预填充内容
- 不修改 SKILL 原有逻辑，仅增强数据层

## 质量保证

- [ ] SKILL 名称与目录名一致
- [ ] description 清晰描述使用场景
- [ ] 企查查数据章节明确标注
- [ ] 输出格式符合法律行业规范
