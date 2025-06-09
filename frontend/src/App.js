import { BrowserRouter, Routes, Route } from 'react-router-dom';
import DashboardLayout from './layout/DashboardLayout';
import Users from './pages/Users';

function App() {
  return (
    <BrowserRouter>
      <DashboardLayout>
        <Routes>
          <Route path="/users" element={<Users />} />
          <Route path="/" element={<div>Bienvenido al Dashboard</div>} />
        </Routes>
      </DashboardLayout>
    </BrowserRouter>
  );
}

export default App;
