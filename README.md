#  SwiftUI 从入坑到精通

## 项目实践

1. 井字棋游戏—用于实践基本的 `@State` 和 `@Binding`，并熟悉 Swift 5.1 的语法



## 井字棋

类似 React 官网教程的那个井字棋游戏。主要学习到了 `@State` 和 `@Binding` 的交互，以及 `SF Symbols` 的使用方式。

`@State` 类似于 React 中的 State, 并且和 React 社区堆 State 的建议一样，Apple 的建议是

1. 不要滥用
2. 多用 `@Binding`
3. 考虑 lift up


而 `@Binding` 可以看成是 React 中的 props，但是只有被这么标记的属性才会成为 props。`@Binding` 除了接受 `@State` 属性的 *$* 形式之外，还接受 `@BindableObject` 和 `@Binding` 自身。前者会在之后的项目中继续学习

整个项目难度不大，主要是一些类型的熟悉和 API 的了解花了点时间。另外还碰到了一个坑：

当时为了判断是否游戏已经结束，我认为直接在 `SquareRow` 的 body 中去计算，然后在确实结束后，去修改 `@Binding` 的值应该就能达到效果。结果是，在当前组件中，状态值确实被修改了，但是父组件对应的 `@State` 还是老样子。
猜测 `@State` 的修改只能由 action 来触发，这些 action 就是一个 Button 的点击事件或者其他对应的手势什么的导致的动作，而不能直接在 body 中调整。这也就类似于，在 render 函数中调用 `setState` 在没有做过 `shouldComponentUpdate` 的组件下，是会直接死循环的
