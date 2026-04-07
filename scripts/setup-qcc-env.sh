#!/bin/bash
# 企查查环境变量配置脚本
# Vibe-Lawyering QCC MCP 增强版

echo "=========================================="
echo "Vibe-Lawyering QCC MCP 环境配置"
echo "=========================================="
echo ""

# 检查环境变量
if [ -z "$QCC_MCP_API_KEY" ]; then
    echo "⚠️  警告: QCC_MCP_API_KEY 未设置"
    echo ""
    echo "请设置环境变量:"
    echo "  export QCC_MCP_API_KEY='your_api_key_here'"
    echo ""
    echo "获取API Key: https://agent.qcc.com"
    echo ""
    exit 1
else
    echo "✅ QCC_MCP_API_KEY 已配置"
    echo "   前缀: ${QCC_MCP_API_KEY:0:8}..."
fi

echo ""
echo "企查查MCP服务配置状态:"
echo "------------------------------------------"

# 检查配置文件中各服务
if [ -f ".mcp.json" ]; then
    echo "✅ .mcp.json 配置文件存在"
    echo ""
    echo "已配置的MCP服务:"
    echo "  📊 qcc-company   - 企业基座服务 (工商登记、股东信息)"
    echo "  ⚠️  qcc-risk      - 风控大脑服务 (18类风险信号)"
    echo "  📚 qcc-ipr       - 知产引擎服务 (专利商标软著)"
    echo "  📈 qcc-operation - 经营罗盘服务 (招投标资质)"
else
    echo "❌ .mcp.json 配置文件不存在"
fi

echo ""
echo "=========================================="
echo "使用示例:"
echo "  /legal-dd-qcc 企查查科技股份有限公司"
echo "  /contract-review-qcc 合同文件.docx"
echo "=========================================="
