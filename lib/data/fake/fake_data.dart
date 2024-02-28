import 'package:hiretop_mobile_app/data/models/job/company_location_dto.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/job/company_dto.dart';
import '../models/job/job_type.dart';
import '../models/user/user_dto.dart';
import '../models/user/user_role.dart';

class FakeData {
  FakeData._();

  static List<String> requirements = [
    "Sed ut perspiciatis unde omnis iste natus error sit.",
    "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.",
    "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
    "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur",
  ];

  static String companyDescription =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas.\nNor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.";

  static String longText =
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem ...';

  static List<UserDto> users = <UserDto>[
    UserDto(
      id: 1,
      firstname: "Freida",
      lastname: "Morar",
      email: "freida.morar@reinger.info",
      phone: "047-614-7452",
      role: UserRole.candidate,
    ),
    UserDto(
      id: 2,
      firstname: "Isom",
      lastname: "Reynolds",
      email: "kshlerin_alfreda@ledner.us",
      phone: "(756)137-4015-057",
      role: UserRole.candidate,
    ),
    UserDto(
      id: 3,
      firstname: "John C",
      lastname: "McConnell",
      email: "mcconnell@gmail.com",
      phone: "12053109781",
      role: UserRole.enterprise,
      company: companies.first,
    ),
  ];

  static List<CompanyLocationDto> locations = <CompanyLocationDto>[
    CompanyLocationDto(city: "South Lake Cordietown", country: "Philippines"),
    CompanyLocationDto(city: "East Port Sheridan", country: "Gabon"),
    CompanyLocationDto(city: "Deshaunview", country: "Czech Republic"),
    CompanyLocationDto(city: "Sheridanbury", country: "Poland"),
    CompanyLocationDto(city: "Kovacekport", country: "Cyprus"),
  ];

  static List<CompanyDto> companies = <CompanyDto>[
    CompanyDto(
      id: 1,
      name: 'Google Inc',
      location: locations.pickOne(),
      website: 'https://crooks.name',
      industry: 'Internet product',
      headOffice: "West Lake Alleneshire, Qatar",
      employeeSize: 38286,
      description: companyDescription,
    ),
    CompanyDto(
      id: 2,
      name: 'Mc Donalds',
      location: locations.pickOne(),
      website: 'https://crooks.name',
      industry: 'Food product',
      headOffice: "Reichelside, Colombia",
      employeeSize: 27658,
      description: companyDescription,
    ),
    CompanyDto(
      id: 3,
      name: 'Heineken',
      location: locations.pickOne(),
      website: 'https://mclaughlin.co.uk',
      industry: 'Drink product',
      headOffice: "Markusland, Turks and Caicos Islands",
      employeeSize: 19681,
      description: companyDescription,
    ),
  ];

  static List<JobDto> jobs = <JobDto>[
    JobDto(
      id: 1,
      jobPosition: 'Assistant Division Manager',
      jobType: JobType.fullTime,
      company: companies.first,
      publishedAt: DateTime.parse("2024-02-06"),
      description: longText,
      requirements: requirements,
      monthlySalary: 46408,
    ),
    JobDto(
      id: 2,
      jobPosition: 'General Marketing Consultant',
      jobType: JobType.partTime,
      company: companies[1],
      publishedAt: DateTime.parse("2024-02-14"),
      description: longText,
      requirements: requirements,
      monthlySalary: 92297,
    ),
    JobDto(
      id: 3,
      jobPosition: 'Executive IT Director',
      jobType: JobType.remote,
      company: companies[2],
      publishedAt: DateTime.parse("2024-01-09"),
      description: longText,
      requirements: requirements,
      monthlySalary: 41979,
    ),
  ];
}
