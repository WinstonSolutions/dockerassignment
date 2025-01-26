# 使用 Node.js 官方镜像作为基础 (可以尝试 node:18 如果遇到问题)
FROM node:18-alpine

# 设置工作目录 (保留 /zhao_wentao_site)
WORKDIR /zhao_wentao_site

# 复制 package 文件和 lock 文件
COPY package.json package-lock.json ./

# 安装依赖
RUN npm install

# 复制所有源代码
COPY . .

# 构建生产版本 (构建产物在 dist 目录)
RUN npm run build

# 暴露端口 7775
EXPOSE 7775

#  选择使用其中一个CMD指令：
# -------------------------------------------------------------------------
# 开发模式启动：
#  * 用于开发环境, 提供热更新
#  * 需要在 docker run 命令中使用端口映射和卷挂载
#  * 例如：docker run -p 7775:7775 -v $(pwd):/zhao_wentao_site your-image-name
#
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "7775"]