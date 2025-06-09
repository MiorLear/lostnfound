import { BrowserRouter, Routes, Route } from 'react-router-dom';
import DashboardLayout from './layout/DashboardLayout';
import Users from './pages/Users';
import Main from './pages/Main';

function App() {
  return (
    <BrowserRouter>
      <DashboardLayout>
        <Routes>
          <Route path="/users" element={<Users />} />
          <Route path="/main" element={<Main/>} />
        </Routes>
      </DashboardLayout>
    </BrowserRouter>
  );
}

export default App;
