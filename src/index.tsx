import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { Provider } from 'react-redux';

import { store } from './store';

import App from './App';
import GlobalStyle from './ui/styles/GlobalStyles';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement,
);

root.render(
  <Provider store={store}>
    <BrowserRouter>
      <GlobalStyle />

      <App />
    </BrowserRouter>
  </Provider>,
);
