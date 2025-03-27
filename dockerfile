# 使用 Node.js 20 的官方镜像作为基础镜像（对应 Setup Node.js 步骤）
FROM node:20

# 设置工作目录
WORKDIR /app

# 复制代码到容器中（对应 Checkout code 步骤）
# 注意：需要在 docker build 时提供上下文，通常是 git 仓库根目录
COPY . .

# 安装 PNPM（对应 Install PNPM 步骤）
RUN npm install -g pnpm

# 安装依赖（对应 Install dependencies 步骤）
RUN pnpm i

# 构建项目（对应 Build project 步骤）
RUN pnpm build

# 可选：运行开发模式（对应 Run dev 步骤）
# 注意：CMD 只在容器启动时运行，这里仅作为示例
CMD ["node", "dist/index.js"]