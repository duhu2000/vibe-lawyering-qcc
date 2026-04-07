---
name: legal-dd-qcc
description: 启动法律尽职调查（企查查MCP增强版），自动获取目标企业工商、股权、风险、知产数据，生成标准化尽调底稿
argument-hint: "[目标企业全称] [--output 输出目录] [--purpose 尽调目的]"
---

# /legal-dd-qcc 命令

## 功能

启动中国法律尽职调查项目，通过企查查MCP自动获取目标企业全景数据，生成标准化尽调底稿。

## 使用方法

```
/legal-dd-qcc 企查查科技股份有限公司 --output ./dd-projects/ --purpose 股权收购
```

## 参数说明

| 参数 | 必需 | 说明 |
|------|------|------|
| `企业全称` | ✅ | 目标公司全称（用于企查查MCP查询） |
| `--output` | 可选 | 项目输出目录（默认当前目录） |
| `--purpose` | 可选 | 尽调目的：股权收购/投资入股/并购等 |
| `--base-date` | 可选 | 调查基准日（默认当日） |

## 自动执行流程

1. **企查查数据获取**：
   - `qcc-company`: 工商登记、股东结构、主要人员
   - `qcc-risk`: 风险信号扫描（18类）
   - `qcc-ipr`: 知识产权清单
   - `qcc-operation`: 经营资质、招投标

2. **项目初始化**：
   - 创建项目目录结构
   - 生成 `project-info.md`
   - 企查查数据预填充至各章节

3. **输出生成**：
   - 标准化尽调底稿模板
   - 企查查原始数据文件（JSON）

## 输出文件

```
[企业名称]-DD/
├── project-info.md          # 项目信息（含企查查摘要）
├── working-paper.md         # 尽调底稿（企查查数据预填充）
├── qcc-data/                # 企查查原始数据
│   ├── company-profile.json
│   ├── shareholders.json
│   ├── risk-signals.json
│   ├── ipr-assets.json
│   └── operation-records.json
└── report/                  # 报告输出目录
```

## 示例

```
/legal-dd-qcc 北京字节跳动科技有限公司 --output ~/projects/ --purpose 投资尽调

→ 自动调用企查查MCP获取数据
→ 生成 ~/projects/北京字节跳动科技有限公司-DD/
→ 底稿第1-10章已预填充企查查数据
```
