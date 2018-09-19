import React from 'react';
import { storiesOf } from '@storybook/react';

storiesOf('Div', module)
    .add('with text', () => (
        <div>Hello Button</div>
    ))
    .add('with some emoji', () => (
        <span role="img" aria-label="so cool">😀 😎 👍 💯</span>
    ));