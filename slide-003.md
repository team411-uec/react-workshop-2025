---
marp: true
paginate: true
theme: react-workshop
footer: "[<i class='ti ti-brand-react'></i> react-workshop](https://github.com/team411-uec/react-workshop-2025)"
math: katex
---

<!-- _paginate: false -->

# React研修2025 第3回<br>Next.js入門編

2025年3月16日
Keita Ito

---

## インストール方法

https://nextjs.org/docs/app/getting-started/installation

---

## App Routerによるファイルベースルーティング

App RouterとPages Routerが存在しているが、現在はPages Routerは非推奨。ネットの情報には、混在しているので注意。ググるときとかは`Next.js App Router`をつけて検索してください。

詳細は公式ドキュメントを参照してください
https://nextjs.org/docs/app/getting-started/project-structure#routing-files

- プライベートルート、パラレルルートなどを使いこなせると、一人前になれます。これまでNext.jsを触ったことがある人は、この研修をきっかけに使えるようになってください。

---

## Next.jsによるSSRの実装

`"use client"`をつけた時は、クライアントコンポーネント、つけないときはサーバーコンポーネントとして動作する。
デフォルトでサーバーコンポーネントで実行される。

---

## サーバーコンポーネントとクライアントコンポーネントの違い

- サーバーコンポーネント
  - サーバーサイドで実行される
  - クライアントサイドでの実行はない
  - つまり、useEffectなどのReactフックは使えない
  - 代わりに、サーバーサイドでデータを取得しやすい

---

#### サーバーサイドでデータを取得する例

サーバーサイドでデータベースからデータを取得して表示する

```jsx
export async function Component() {
  const data = await sql.query("SELECT * FROM todos");
  return (
    <ul>
      {data.map((todo) => (
        <li key={todo.id}>{todo.title}</li>
      ))}
    </ul>
  );
}
```

---

#### クライアントコンポーネント

- サーバーサイド、クライアントサイドの両方で実行される
- useEffectなどのReactフックが使用可能
- ただし、フックはサーバーサイドでの実行時には無視される

---

#### クライアントコンポーネントでデータを取得する例

```jsx
"use client";

export function Component() {
  const [data, setData] = useState([]);
  useEffect(() => {
    fetch("/api/todos")
      .then((res) => res.json())
      .then((data) => setData(data));
  }, []);

  return (
    <ul>
      {data.map((todo) => (
        <li key={todo.id}>{todo.title}</li>
      ))}
    </ul>
  );
}
```

---

### サーバーサイドでfetchすると？

- サーバーサイドでfetchすると、サーバーサイドで実行される（Ajaxではない）
- つまり、サーバー側でhttpリクエストを実行するか、ブラウザでhttpリクエストを実行するかの違い

```jsx
export async function Component() {
  const res = await fetch("https://jsonplaceholder.typicode.com/todos");
  const data = await res.json();
  return (
    <ul>
      {data.map((todo) => (
        <li key={todo.id}>{todo.title}</li>
      ))}
    </ul>
  );
}
```
