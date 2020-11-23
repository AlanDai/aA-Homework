import React from "react";

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        // your code here
        this.state = { num1: '', num2: '', result: 0 }
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);

    }

    setNum1(e) {
        const num1 = e.target.value ? +e.target.value : "";
        this.setState({ num1 });
    }

    setNum2(e) {
        const num2 = e.target.value ? +e.target.value : "";
        this.setState({ num2 });
    }

    add(e) {
        e.preventDefault();
        const result = this.state.num1 + this.state.num2;
        this.setState({ result });
    }

    subtract(e) {
        e.preventDefault();
        const result = this.state.num1 - this.state.num2;
        this.setState({ result });
    }

    mutliply(e) {
        e.preventDefault();
        const result = this.state.num1 * this.state.num2;
        this.setState({ result });
    }

    divide(e) {
        e.preventDefault();
        const result = this.state.num1 / this.state.num2;
        this.setState({ result });
    }

    clear(e) {
        e.preventDefault();
        this.setState({ num1: "", num2: "", result: 0 })
    }

    render() {
        return (
            <div>
                <h1>{this.state.result}</h1>
                <input onChange={this.setNum1} value={this.state.num1} />
                <input onChange={this.setNum2} value={this.state.num2} />
                <button onClick={this.clear}>Clear</button>
                <br/>
                <button onClick={this.add}>+</button>
                <button onClick={this.subtract}>-</button>
                <button onClick={this.multiply}>*</button>
                <button onClick={this.divide}>/</button>
                <br/>
            </div>
        );
    }
}

export default Calculator;