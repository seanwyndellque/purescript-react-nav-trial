import React, { Component } from 'react';
import { Button, Platform, StyleSheet, Text, View } from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation';
import { TextInput } from 'react-native-gesture-handler';

import { operation } from './output/Nav.Operation';
import { inputs } from './output/Nav.Inputs';
import { answer } from './output/Nav.Answer';

import { app } from './output/Nav.App';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

class Operation extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Operation</Text>
        <Button
          title="add"
          onPress={() =>
            this.props.navigation.push('Inputs', {
              operation: 'add',
            })
          }
        />
        <Button
          title="multiply"
          onPress={() =>
            this.props.navigation.push('Inputs', {
              operation: 'multiply',
            })
          }
        />
      </View>
    );
  }
}

class Inputs extends Component {
  state = {
    inputA: '5',
    inputB: '1',
  };
  solve = (operation, a, b) => {
    console.log(a, operation, b);
    console.log(parseInt(a));
    switch (operation) {
      case 'add':
        return parseInt(a) + parseInt(b);
        break;
      case 'multiply':
        return parseInt(a) * parseInt(b);
        break;

      default:
        break;
    }
  };
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Inputs</Text>
        <TextInput
          value={this.state.inputA}
          onChangeText={(text) => this.setState({ inputA: text })}
        />
        <TextInput
          value={this.state.inputB}
          onChangeText={(text) => this.setState({ inputB: text })}
        />
        <Button
          title="solve"
          onPress={() =>
            this.props.navigation.push('Answer', {
              answer: this.solve(
                this.props.navigation.getParam('operation'),
                this.state.inputA,
                this.state.inputB,
              ),
            })
          }
        />
      </View>
    );
  }
}

class Answer extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Answer</Text>
        <Text style={styles.welcome}>
          {this.props.navigation.getParam('answer')}
        </Text>
        <Button title="next" onPress={() => this.props.navigation.popToTop()} />
      </View>
    );
  }
}

const AppNavigator = createStackNavigator({
  Operation: operation,
  Inputs: inputs,
  Answer: answer,
});

export default app;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
