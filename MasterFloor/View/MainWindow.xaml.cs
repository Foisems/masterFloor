using MasterFloor.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterFloor.View
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                using (var db = new masterFloorEntities2())
                {
                    if (loginTB.Text == "")
                    {
                        MessageBox.Show("Введите логин", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    if (passwordTB.Password == "")
                    {
                        MessageBox.Show("Введите пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    var user = db.User.FirstOrDefault(u => u.Username == loginTB.Text && u.Password == passwordTB.Password);
                    if (user != null)
                    {
                        var partnerWindow = new PartnerList();
                        partnerWindow.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Неверный логин или пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
